//
//  CachedRepositoryListModuleProtocols.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 03.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import Foundation

//MARK: Router -
protocol CachedRepositoryListModuleRouterInput: class {
    func openRepositoryDetail(url: URL)
}
//MARK: Presenter -
protocol CachedRepositoryListModulePresenterProtocol: class {

    var interactor: CachedRepositoryListModuleInteractorInputProtocol? { get set }
    
    func openRepositoryDetail(url: URL)
    
    func didLoadView()
    func didSelectRowAt(index: IndexPath)
}

//MARK: Interactor -
protocol CachedRepositoryListModuleInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    func showError(text: String)
    func updateDataSource(repositories: [Repository])
}

protocol CachedRepositoryListModuleInteractorInputProtocol: class {

    

    /* Presenter -> Interactor */
    func getRepositories()
    func didSelectItem(index: Int)
}

//MARK: View -
protocol CachedRepositoryListModuleViewProtocol: class {

    var presenter: CachedRepositoryListModulePresenterProtocol?  { get set }

    /* Presenter -> ViewController */
    func updateDataSource(repositories: [Repository])
    func showOkAlert(title: String?, text: String?)
}
