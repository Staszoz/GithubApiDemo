//
//  RepositorySearchModuleProtocols.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 04.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//
//

import Foundation

//MARK: Router
protocol RepositorySearchModuleRouterInput: class {
    func openCachedRepositoryListModule()
    func openRepositoryListModule(searchText: String)
}

//MARK: View
protocol RepositorySearchModuleViewInput: class {
    func showOkAlert(title: String?, text: String?)
}

protocol RepositorySearchModuleViewOutput: class {
    func didTapSearch(text: String?)
    func didTapShowHistory()
}

//MARK: Presenter
protocol RepositorySearchModuleInput: class {}


//MARK: Interactor
protocol RepositorySearchModuleInteractorInput: class {
    func validate(searchText: String?)
}

protocol RepositorySearchModuleInteractorOutput: class {
    func showError(text: String)
    func openRepositoryListModule(searchText: String)
}



