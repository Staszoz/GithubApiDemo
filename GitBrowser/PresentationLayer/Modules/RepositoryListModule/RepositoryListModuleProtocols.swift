//
//  RepositoryListModuleProtocols.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 04.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//
//

import UIKit

//MARK: Router
protocol RepositoryListModuleRouterInput: class {
    func openRepositoryDetail(url: URL, repositoryId: Int32?)
}

//MARK: View
protocol RepositoryListModuleViewInput: class {
    func showOkAlert(title: String?, text: String?)
    func configureNavigationTitle(text: String)
    func alactivityIndicator(isShow: Bool)
    func updateDataSource(repositories: [Repository])
    func insert(newRepositories: [Repository], for indexPathsArray: [IndexPath])
}

protocol RepositoryListModuleViewOutput: class {
    func didLoadView()
    func didDisplay(currentScrollOffset: CGFloat, maxScrollOffset: CGFloat)
    func didSelectRowAt(index: IndexPath)
}

//MARK: Presenter
protocol RepositoryListModuleInput: class {
    var presenterStateStorage: RepositoryListModulePresenterStateStorage {get set}
}

//MARK: Interactor
protocol RepositoryListModuleInteractorInput: class {
    func getRepositories(searchText: String)
    func didSelectItem(index: Int)
}

protocol RepositoryListModuleInteractorOutput: class {
    func showError(text: String)
    func showActivityIndicator()
    func hideActivityIndicator()
    func updateDataSource(repositories: [Repository])
    func insert(newRepositories: [Repository], oldDataCount: Int)
    func openRepositoryDetail(url: URL)
}



