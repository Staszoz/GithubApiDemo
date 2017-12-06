//
//  CachedRepositoryListModuleViewController.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 03.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import UIKit

class CachedRepositoryListModuleViewController: UIViewController  {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

    //MARK: - Properties
    var presenter: CachedRepositoryListModulePresenterProtocol?
    var displayManager = CachedRepositoryListDataDisplayManager()

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.didLoadView()
        displayManager.configureFor(tableView: tableView, baseDelegate: self)
    }
}

extension CachedRepositoryListModuleViewController: CachedRepositoryListModuleViewProtocol {
    
    func updateDataSource(repositories: [Repository]) {
        displayManager.updateTableWith(repositories: repositories)
    }
    
    func insert(newRepositories: [Repository], for indexesPath: [IndexPath]) {
        displayManager.insert(newRepositories: newRepositories, for: indexesPath)
    }
}

extension CachedRepositoryListModuleViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelectRowAt(index: indexPath)
    }
}
