//
//  RepositoryDetailModuleRouter.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 05.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//
//

import UIKit

class RepositoryDetailModuleRouter {
    
    //MARK: - Properties
    weak var view: UIViewController?
}

extension RepositoryDetailModuleRouter: RepositoryDetailModuleRouterInput {
    
    func dissmis(with animation: Bool) {
        view?.dismiss(animated: animation, completion: nil)
    }
}
