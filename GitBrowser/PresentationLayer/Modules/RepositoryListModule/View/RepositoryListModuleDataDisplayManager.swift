//
//  RepositoryListModuleDataDisplayManager.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 04.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//
//

import UIKit

class RepositoryListDataDisplayManager: NSObject {
    
    var repositories: [Repository] = []
    weak var tableView: UITableView?
    weak var baseDelegate: UITableViewDelegate?
    
    func configureFor(tableView: UITableView, baseDelegate: UITableViewDelegate) {
        self.tableView = tableView
        self.baseDelegate = baseDelegate
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: RepositoryTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: RepositoryTableViewCell.reuseId)
    }
    
    func updateTableWith(repositories: [Repository]) {
        self.repositories = repositories
        tableView?.reloadData()
    }
    
    func insert(newRepositories: [Repository], for indexesPath: [IndexPath]) {
        repositories.append(contentsOf: newRepositories)
//        tableView?.reloadData()
        
        self.tableView?.beginUpdates()
        self.tableView?.insertRows(at: indexesPath, with: .top)
        self.tableView?.endUpdates()
    }
}

extension RepositoryListDataDisplayManager: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryTableViewCell.reuseId, for: indexPath) as! RepositoryTableViewCell
        cell.configure(repositoryViewModel: repositories[indexPath.row])
        return cell
    }
}

extension RepositoryListDataDisplayManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let _baseDelegate = baseDelegate, _baseDelegate.responds(to: #selector(tableView(_:didSelectRowAt:))) {
            _baseDelegate.tableView?(tableView, didSelectRowAt: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let _baseDelegate = baseDelegate, _baseDelegate.responds(to: #selector(scrollViewDidEndDecelerating(_:))) {
            _baseDelegate.scrollViewDidEndDecelerating?(scrollView)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if let _baseDelegate = baseDelegate, _baseDelegate.responds(to: #selector(scrollViewDidEndDragging(_:willDecelerate:))) {
            _baseDelegate.scrollViewDidEndDragging?(scrollView, willDecelerate: decelerate)
        }
    }
}
