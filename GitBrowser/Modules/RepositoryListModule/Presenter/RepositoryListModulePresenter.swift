//
//  RepositoryListModulePresenter.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 02.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//
//

import UIKit

class RepositoryListModulePresenter {

    weak private var view: RepositoryListModuleViewProtocol?
    var interactor: RepositoryListModuleInteractorProtocol?
    private let router: RepositoryListModuleWireframeProtocol
    
    var stateStorage: RepositoryListModuleSateStorage

    init(interface: RepositoryListModuleViewProtocol, interactor: RepositoryListModuleInteractorProtocol?, router: RepositoryListModuleWireframeProtocol, stateStorage: RepositoryListModuleSateStorage) {
        self.view = interface
        self.interactor = interactor
        self.router = router
        self.stateStorage = stateStorage
    }
}

extension RepositoryListModulePresenter: RepositoryListModulePresenterInput {
    
    func didLoadView() {
        interactor?.getRepositories(searchText: stateStorage.searchText, offset: 0)
    }
    
    func willDisplayCell(index: Int) {
        interactor?.willDisplayCell(index: index, searchText: stateStorage.searchText)
    }
    
    func didDisplayLastCell() {
        interactor?.didDisplayLastCell(searchText: stateStorage.searchText)
    }
    
    func didSelectRowAt(index: IndexPath) {
        interactor?.didSelectItem(index: index.row)
    }
}

extension RepositoryListModulePresenter: RepositoryListModulePresenterOutput {
    
    func showError(text: String) {
        view?.showOkAlert(title: "Error", text: text)
    }
    
    func updateDataSource(repositories: [Repository]) {
        DispatchQueue.main.async {
            self.view?.updateDataSource(repositories: repositories)
        }
    }
    
    func insert(newRepositories: [Repository], oldDataCount: Int) {
        
        var indexPathsArray = [IndexPath]()
        for (index, _) in newRepositories.enumerated() {
            let indexPath = IndexPath(row: oldDataCount + index, section: 0)
            indexPathsArray.append(indexPath)
        }
        
        DispatchQueue.main.async {
            self.view?.insert(newRepositories: newRepositories, for: indexPathsArray)
        }
    }
    
    func openRepositoryDetail(url: URL) {
        router.openRepositoryDetail(url: url)
    }
}
