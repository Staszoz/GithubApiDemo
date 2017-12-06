//
//  CachedRepositoryListModuleAssembly.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 05.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//
//

import UIKit

final class CachedRepositoryListModuleAssembly {
    
    var view: UIViewController {
        guard let viewController = UIStoryboard(name: ModulesConstant.Storyboard.cachedRepositoryList.rawValue, bundle: nil).instantiateInitialViewController() as? CachedRepositoryListModuleViewController else {
            assert(false, "\(self) should be defined")
        }
        
        self.configureModule(view: viewController)
        return viewController
    }
    
    private func configureModule(view: CachedRepositoryListModuleViewController) {
        let repositoriesService = RepositoriesCachedServiceImpl()
        let router = CachedRepositoryListModuleRouter()
        let interactor = CachedRepositoryListModuleInteractor(repositoriesService: repositoriesService)
        let presenter = CachedRepositoryListModulePresenter(interface: view, interactor: interactor, router: router)
        
        router.view = view
        presenter.interactor = interactor
        interactor.output = presenter
        view.output = presenter
    }
}
