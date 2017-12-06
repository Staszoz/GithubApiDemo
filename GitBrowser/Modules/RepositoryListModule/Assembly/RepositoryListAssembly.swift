//
//  RepositoryListAssembly.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 02.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import UIKit


final class RepositoryListAssembly {
    
    var stateStorage: RepositoryListModuleSateStorage
    
    init(stateStorage: RepositoryListModuleSateStorage) {
        self.stateStorage = stateStorage
    }
    
    var view: RepositoryListModuleViewController {
        guard let viewController = UIStoryboard(name: "RepositoryListModule", bundle: nil).instantiateInitialViewController() as? RepositoryListModuleViewController else {
            assert(false, "\(self) should be defined")
        }
        
        self.configureModule(view: viewController)
        
        return viewController
    }
    
    private func configureModule(view: RepositoryListModuleViewController) {
        let repositoriesService = RepositoriesApiService(itemsPerPage: 15, concurrentlyCountQueues: 2)
        let interactor = RepositoryListModuleInteractor(repositoriesService: repositoriesService)
        let router = RepositoryListModuleRouter()
        let presenter = RepositoryListModulePresenter(interface: view, interactor: interactor, router: router, stateStorage: stateStorage)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.view = view
    }
}
