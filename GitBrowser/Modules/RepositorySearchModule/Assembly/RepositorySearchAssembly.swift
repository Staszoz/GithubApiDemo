//
//  RepositorySearchAssembly.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 02.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import UIKit


final class RepositorySearchAssembly {
    
    var view: UIViewController {
        guard let viewController = UIStoryboard(name: "RepositorySearchModule", bundle: nil).instantiateInitialViewController() as? RepositorySearchViewController else {
            assert(false, "\(self) should be defined")
        }
        
        self.configureModule(view: viewController)
        return viewController
    }
    
    private func configureModule(view: RepositorySearchViewController) {
        
        let router = RepositorySearchRouter()
        router.view = view
        
        let presenter = RepositorySearchPresenter()
        presenter.view = view
        presenter.router = router
        
        let interactor = RepositorySearchInteractor()
        interactor.presenter = presenter
        
        presenter.interactor = interactor
        view.presenter = presenter
    }
}
