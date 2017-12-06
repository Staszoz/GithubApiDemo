//
//  RepositoryDetailModuleProtocols.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 05.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//
//

import UIKit

//MARK: Router
protocol RepositoryDetailModuleRouterInput: class {
    func dissmis(with animation: Bool)
}

//MARK: View
protocol RepositoryDetailModuleViewInput: class {
    func openPage(with url: URL)
}

protocol RepositoryDetailModuleViewOutput: class {
    func didLoadView()
    func didTapCloseButton()
    func didGesturePerform(sender: UITapGestureRecognizer)
}

//MARK: Presenter
protocol RepositoryDetailModuleInput: class {
    var presenterStateStorage: RepositoryDetailModulePresenterStateStorage {get set}
}

protocol RepositoryDetailModuleOutput: class {
    func didChangeRepository(id: Int32?)
}

//MARK: Interactor
protocol RepositoryDetailModuleInteractorInput: class {
    func markAsViewed(repositoryId: Int32?)
}

protocol RepositoryDetailModuleInteractorOutput: class {}



