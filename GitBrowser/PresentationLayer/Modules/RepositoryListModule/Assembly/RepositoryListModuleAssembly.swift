//
//  RepositoryListModuleAssembly.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 04.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//
//

import UIKit

private let kItemsPerPageDefault = 15
private let kConcurrentQueuesDefault = 2

final class RepositoryListModuleAssembly {
    
    var presenterStateStorage: RepositoryListModulePresenterStateStorage
    
    init(presenterStateStorage: RepositoryListModulePresenterStateStorage) {
        self.presenterStateStorage = presenterStateStorage
    }
    
    var view: UIViewController {
        guard let viewController = UIStoryboard(name: ModulesConstant.Storyboard.repositoryList.rawValue, bundle: nil).instantiateInitialViewController() as? RepositoryListModuleViewController else {
            assert(false, "\(self) should be defined")
        }
        
        self.configureModule(view: viewController)
        return viewController
    }
    
    private func configureModule(view: RepositoryListModuleViewController) {
        let repositoriesService = RepositoriesApiServiceImpl(itemsPerPage: kItemsPerPageDefault, concurrentQueues: kConcurrentQueuesDefault)
        let router = RepositoryListModuleRouter()
        let interactor = RepositoryListModuleInteractor(repositoriesService: repositoriesService)
        let presenter = RepositoryListModulePresenter(interface: view, interactor: interactor, router: router, presenterStateStorage: presenterStateStorage)
        
        router.view = view
        presenter.interactor = interactor
        interactor.output = presenter
        view.output = presenter
    }
}
