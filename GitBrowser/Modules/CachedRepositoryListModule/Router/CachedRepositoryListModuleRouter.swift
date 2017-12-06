//
//  CachedRepositoryListModuleRouter.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 03.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import UIKit

class CachedRepositoryListModuleRouter: CachedRepositoryListModuleRouterInput {

    weak var view: UIViewController?
    
    
    func openRepositoryDetail(url: URL) {
        let stateStorage = RepositoryDetailModulePresenterStateStorage(url: url)
        let repositoryDetailModuleView = RepositoryDetailModuleAssembly(presenterStateStorage: stateStorage).view
        
        
        repositoryDetailModuleView.modalTransitionStyle = .crossDissolve
        repositoryDetailModuleView.modalPresentationStyle = .overCurrentContext
        view?.present(repositoryDetailModuleView, animated: true, completion: nil)
    }

}
