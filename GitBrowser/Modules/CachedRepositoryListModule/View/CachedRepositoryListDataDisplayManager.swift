//
//  RepositoryListDataDisplayManager.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 02.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import UIKit

class CachedRepositoryListDataDisplayManager: NSObject {
    
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
        self.tableView?.reloadData()
    }
    
    func insert(newRepositories: [Repository], for indexesPath: [IndexPath]) {
         self.repositories.append(contentsOf: newRepositories)
        
        self.tableView?.beginUpdates()
        self.tableView?.insertRows(at: indexesPath, with: .automatic)
        self.tableView?.endUpdates()
    }
}

extension CachedRepositoryListDataDisplayManager: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryTableViewCell.reuseId, for: indexPath) as! RepositoryTableViewCell
        cell.configure(repositoryViewModel: repositories[indexPath.row])
        return cell
    }
}

extension CachedRepositoryListDataDisplayManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let _baseDelegate = baseDelegate, _baseDelegate.responds(to: #selector(tableView(_:didSelectRowAt:))) {
            _baseDelegate.tableView?(tableView, didSelectRowAt: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let _baseDelegate = baseDelegate, _baseDelegate.responds(to: #selector(tableView(_:heightForRowAt:))) {
            return _baseDelegate.tableView?(tableView, heightForRowAt: indexPath) ?? UITableViewAutomaticDimension
        }
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let _baseDelegate = baseDelegate, _baseDelegate.responds(to: #selector(tableView(_:willDisplay:forRowAt:))) {
            _baseDelegate.tableView?(tableView, willDisplay: cell, forRowAt: indexPath)
        }
    }
}
