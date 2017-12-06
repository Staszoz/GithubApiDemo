//
//  RepositoryListModuleRouter.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 02.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//
//

import UIKit

class RepositoryListModuleRouter {
    
    weak var view: UIViewController?
    
}

extension RepositoryListModuleRouter: RepositoryListModuleWireframeProtocol {
    
    func openRepositoryDetail(url: URL) {
        let repositoryDetailModuleView = RepositoryDetailModuleAssembly(stateStorage: RepositoryDetailModuleStateStorage(url: url)).view
        repositoryDetailModuleView.modalTransitionStyle = .crossDissolve
        repositoryDetailModuleView.modalPresentationStyle = .overCurrentContext
        view?.present(repositoryDetailModuleView, animated: true, completion: nil)
    }
}
