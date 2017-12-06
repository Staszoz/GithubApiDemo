//
//  RepositorySearchRouter.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 02.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import UIKit


class RepositorySearchRouter {
    
    weak var view: UIViewController?
}

extension RepositorySearchRouter: RepositorySearchRouterInput {
    
    func openCachedRepositoryListModule() {
        let cachedRepositoryListView = CachedRepositoryListModuleAssembly().view
        view?.navigationController?.pushViewController(cachedRepositoryListView, animated: true)
    }
    
    func openRepositoryListModule(searchText: String) {
        let repositoryListView = RepositoryListAssembly(stateStorage: RepositoryListModuleSateStorage(searchText: searchText)).view
        view?.navigationController?.pushViewController(repositoryListView, animated: true)
    }
    
}
