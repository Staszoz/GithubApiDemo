//
//  RepositoryListModulePresenter.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 04.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//
//

import UIKit

class RepositoryListModulePresenter: RepositoryListModuleInput {

    //MARK: - Properties
    weak private var view: RepositoryListModuleViewInput?
    var interactor: RepositoryListModuleInteractorInput?
    private let router: RepositoryListModuleRouterInput
    
    var presenterStateStorage: RepositoryListModulePresenterStateStorage

    
    init(interface: RepositoryListModuleViewInput, interactor: RepositoryListModuleInteractorInput?, router: RepositoryListModuleRouterInput, presenterStateStorage: RepositoryListModulePresenterStateStorage) {
        self.view = interface
        self.interactor = interactor
        self.router = router
        self.presenterStateStorage = presenterStateStorage
    }
}

extension RepositoryListModulePresenter: RepositoryListModuleViewOutput {
    
    func didLoadView() {
        view?.configureNavigationTitle(text: presenterStateStorage.searchText)
        interactor?.getRepositories(searchText: presenterStateStorage.searchText)
    }
    
    func didDisplay(currentScrollOffset: CGFloat, maxScrollOffset: CGFloat) {
        if maxScrollOffset - currentScrollOffset <= 0 {
            interactor?.getRepositories(searchText: presenterStateStorage.searchText)
        }
    }
    
    func didSelectRowAt(index: IndexPath) {
        interactor?.didSelectItem(index: index.row)
    }
}

extension RepositoryListModulePresenter: RepositoryListModuleInteractorOutput {
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            self.view?.alactivityIndicator(isShow: true)
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.view?.alactivityIndicator(isShow: false)
        }
    }
    
    func showError(text: String) {
        DispatchQueue.main.async {
            self.view?.showOkAlert(title: "Error", text: text)
        }
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
        router.openRepositoryDetail(url: url, repositoryId: nil)
    }
}
