//
//  RepositoryListModuleProtocols.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 02.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//
//

import Foundation

//MARK: Wireframe -
protocol RepositoryListModuleWireframeProtocol: class {
    func openRepositoryDetail(url: URL)
}
//MARK: Presenter -
protocol RepositoryListModulePresenterInput: class {
    var stateStorage: RepositoryListModuleSateStorage {get set}
    
    func didLoadView()
    
    func didDisplayLastCell()
    func willDisplayCell(index: Int)
    
    func didSelectRowAt(index: IndexPath)
}

protocol RepositoryListModulePresenterOutput: class {
    
    func showError(text: String)
    func updateDataSource(repositories: [Repository])
    func insert(newRepositories: [Repository], oldDataCount: Int)
    func openRepositoryDetail(url: URL)
}

//MARK: Interactor -
protocol RepositoryListModuleInteractorProtocol: class {

    var presenter: RepositoryListModulePresenterOutput?  { get set }
    
    func getRepositories(searchText: String, offset: Int)
    
    func didDisplayLastCell(searchText: String)
    func willDisplayCell(index: Int, searchText: String)
    
    func didSelectItem(index: Int)
}

//MARK: View -
protocol RepositoryListModuleViewProtocol: class {

    var presenter: RepositoryListModulePresenterInput?  { get set }
    
    func showOkAlert(title: String?, text: String?)
    func updateDataSource(repositories: [Repository])
    func insert(newRepositories: [Repository], for indexesPath: [IndexPath])
}
