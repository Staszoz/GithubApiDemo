//
//  RepositoryListModuleViewController.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 02.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//
//

import UIKit

class RepositoryListModuleViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var presenter: RepositoryListModulePresenterInput?
    var displayManager = RepositoryListDataDisplayManager()
    
    //MARK: - Life cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.didLoadView()
        displayManager.configureFor(tableView: tableView, baseDelegate: self)
    }
}

extension RepositoryListModuleViewController: RepositoryListModuleViewProtocol {
    
    func updateDataSource(repositories: [Repository]) {
        displayManager.updateTableWith(repositories: repositories)
    }
    
    func insert(newRepositories: [Repository], for indexesPath: [IndexPath]) {
        displayManager.insert(newRepositories: newRepositories, for: indexesPath)
    }
}

extension RepositoryListModuleViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelectRowAt(index: indexPath)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if tableView.contentOffset.y >= tableView.contentSize.height - tableView.bounds.size.height {
//            presenter?.didDisplayLastCell()
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if tableView.contentOffset.y >= tableView.contentSize.height - tableView.bounds.size.height {
            presenter?.didDisplayLastCell()
        }
    }
}

