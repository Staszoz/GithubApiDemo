//
//  CachedRepositoryListModuleRouter.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 05.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//
//

import UIKit

class CachedRepositoryListModuleRouter {
    
    //MARK: - Properties
    weak var view: UIViewController?
    
}

extension CachedRepositoryListModuleRouter: CachedRepositoryListModuleRouterInput {
    
    func openRepositoryDetail(url: URL, repositoryId: Int32?, presenter: RepositoryDetailModuleOutput) {
        let stateStorage = RepositoryDetailModulePresenterStateStorage(url: url, repositoryId: repositoryId)
        let repositoryDetailModuleView = RepositoryDetailModuleAssembly(presenterStateStorage: stateStorage, presenter: presenter).view
        
        repositoryDetailModuleView.modalTransitionStyle = .crossDissolve
        repositoryDetailModuleView.modalPresentationStyle = .overCurrentContext
        view?.present(repositoryDetailModuleView, animated: true, completion: nil)
    }
}
