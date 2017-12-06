//
//  RepositorySearchInteractorInterface.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 02.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import Foundation

protocol RepositorySearchInteractorInput: class {
    func validate(searchText: String?)
}

protocol RepositorySearchInteractorOutput: class {
    func showError(text: String)
    func openRepositoryListModule(searchText: String)
}
