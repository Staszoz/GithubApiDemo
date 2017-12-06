//
//  CachedRepositoryListModuleAssembly.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 02.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import UIKit


final class CachedRepositoryListModuleAssembly {
    
    var view: CachedRepositoryListModuleViewController {
        guard let viewController = UIStoryboard(name: "CachedRepositoryListModule", bundle: nil).instantiateInitialViewController() as? CachedRepositoryListModuleViewController else {
            assert(false, "\(self) should be defined")
        }
        
        self.configureModule(view: viewController)
        
        return viewController
    }
    
    private func configureModule(view: CachedRepositoryListModuleViewController) {
        let repositoriesService = RepositoriesCachedService(itemsPerPage: 15, concurrentlyCountQueues: 2)
        let interactor = CachedRepositoryListModuleInteractor(repositoriesService: repositoriesService)
        let router = CachedRepositoryListModuleRouter()
        let presenter = CachedRepositoryListModulePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.view = view
    }
}
