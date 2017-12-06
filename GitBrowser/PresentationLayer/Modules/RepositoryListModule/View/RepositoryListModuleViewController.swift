//
//  RepositoryListModuleViewController.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 04.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//
//

import UIKit

class RepositoryListModuleViewController: UIViewController {
    
    //MARK: - @IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    //MARK: - Properties
	var output: RepositoryListModuleViewOutput?
    var displayManager = RepositoryListDataDisplayManager()
    

    //MARK: - Life cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        
        output?.didLoadView()
        displayManager.configureFor(tableView: tableView, baseDelegate: self)
    }
}

extension RepositoryListModuleViewController: RepositoryListModuleViewInput {
    
    func configureNavigationTitle(text: String) {
        title = text
    }
    
    func updateDataSource(repositories: [Repository]) {
        displayManager.updateTableWith(repositories: repositories)
    }
    
    func insert(newRepositories: [Repository], for indexPathsArray: [IndexPath]) {
        displayManager.insert(newRepositories: newRepositories, for: indexPathsArray)
    }
    
    func alactivityIndicator(isShow: Bool) {
        isShow ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
}

extension RepositoryListModuleViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        output?.didSelectRowAt(index: indexPath)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        output?.didDisplay(currentScrollOffset: currentOffset, maxScrollOffset: maximumOffset)
    }
}
