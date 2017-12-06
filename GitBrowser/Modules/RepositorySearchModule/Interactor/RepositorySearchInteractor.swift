//
//  RepositorySearchInteractor.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 02.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import Foundation


class RepositorySearchInteractor {
    
    weak var presenter: RepositorySearchInteractorOutput!
}

extension RepositorySearchInteractor: RepositorySearchInteractorInput {
    
    func validate(searchText: String?) {
        if let _searchText = searchText, !_searchText.isEmpty {
            presenter.openRepositoryListModule(searchText: _searchText)
            
        } else {
            presenter.showError(text: "Enter search text!")
        }
    }
}
