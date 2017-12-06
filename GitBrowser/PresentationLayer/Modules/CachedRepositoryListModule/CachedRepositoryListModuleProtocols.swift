//
//  CachedRepositoryListModuleProtocols.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 05.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//
//

import Foundation

//MARK: Router
protocol CachedRepositoryListModuleRouterInput: class {
    func openRepositoryDetail(url: URL, repositoryId: Int32?, presenter: RepositoryDetailModuleOutput)
}

//MARK: View
protocol CachedRepositoryListModuleViewInput: class {
    func configureNavigationTitle(text: String)
    func updateDataSource(repositories: [Repository])
    func showOkAlert(title: String?, text: String?)
}

protocol CachedRepositoryListModuleViewOutput: class {
    func didLoadView()
    func didSelectRowAt(index: IndexPath)
}

//MARK: Presenter
protocol CachedRepositoryListModuleInput: class {}


//MARK: Interactor
protocol CachedRepositoryListModuleInteractorInput: class {
    func getRepositories()
    func didSelectItem(index: Int)
    func reloadRepsitoryBy(id: Int32?)
}

protocol CachedRepositoryListModuleInteractorOutput: class {
    func showError(text: String)
    func updateDataSource(repositories: [Repository])
    func openRepositoryDetail(url: URL, repositoryId: Int32?)
}



