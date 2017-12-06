//
//  RepositorySearchPresenter.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 02.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import Foundation


class RepositorySearchPresenter {
    
    var interactor: RepositorySearchInteractorInput!
    var router: RepositorySearchRouterInput!
    weak var view: RepositorySearchViewInput?
}

extension RepositorySearchPresenter: RepositorySearchInteractorOutput {
    
    func showError(text: String) {
        view?.showOkAlert(title: "Error", text: text)
    }
    
    func openRepositoryListModule(searchText: String) {
        router.openRepositoryListModule(searchText: searchText)
    }
}


extension RepositorySearchPresenter: RepositorySearchViewOutput {
    
    func didTapSearch(text: String?) {
        interactor.validate(searchText: text)
    }
    
    func didTapShowHistory() {
        router.openCachedRepositoryListModule()
    }
}
