//
//  CachedRepositoryListModulePresenter.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 03.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import UIKit

class CachedRepositoryListModulePresenter {

    weak private var view: CachedRepositoryListModuleViewProtocol?
    var interactor: CachedRepositoryListModuleInteractorInputProtocol?
    private let router: CachedRepositoryListModuleRouterInput
    

    init(interface: CachedRepositoryListModuleViewProtocol, interactor: CachedRepositoryListModuleInteractorInputProtocol?, router: CachedRepositoryListModuleRouterInput) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}


extension CachedRepositoryListModulePresenter: CachedRepositoryListModulePresenterProtocol {
    
    func didLoadView() {
        interactor?.getRepositories()
    }
    
    func didSelectRowAt(index: IndexPath) {
        interactor?.didSelectItem(index: index.row)
    }
    
    func openRepositoryDetail(url: URL) {
        
    }
}

extension CachedRepositoryListModulePresenter: CachedRepositoryListModuleInteractorOutputProtocol {
    
    func showError(text: String) {
        view?.showOkAlert(title: "Error", text: text)
    }

    func updateDataSource(repositories: [Repository]) {
        DispatchQueue.main.async {
            self.view?.updateDataSource(repositories: repositories)
        }
    }
}
