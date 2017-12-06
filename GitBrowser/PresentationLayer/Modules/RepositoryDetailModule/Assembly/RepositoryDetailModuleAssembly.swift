//
//  RepositoryDetailModuleAssembly.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 05.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//
//

import UIKit

final class RepositoryDetailModuleAssembly {
    
    var presenterStateStorage: RepositoryDetailModulePresenterStateStorage
    weak var presenter: RepositoryDetailModuleOutput?
    
    init(presenterStateStorage: RepositoryDetailModulePresenterStateStorage, presenter: RepositoryDetailModuleOutput?) {
        self.presenterStateStorage = presenterStateStorage
        self.presenter = presenter
    }
    
    var view: UIViewController {
        guard let viewController = UIStoryboard(name: ModulesConstant.Storyboard.repositoryDetail.rawValue, bundle: nil).instantiateInitialViewController() as? RepositoryDetailModuleViewController else {
            assert(false, "\(self) should be defined")
        }
        
        self.configureModule(view: viewController)
        return viewController
    }
    
    private func configureModule(view: RepositoryDetailModuleViewController) {
        let router = RepositoryDetailModuleRouter()
        let interactor = RepositoryDetailModuleInteractor()
        let presenter = RepositoryDetailModulePresenter(interface: view, interactor: interactor, router: router, presenterStateStorage: presenterStateStorage)
        presenter.outputHandler = self.presenter
        
        router.view = view
        presenter.interactor = interactor
        interactor.output = presenter
        view.output = presenter
    }
}
