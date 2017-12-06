//
//  RepositorySearchViewInterface.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 02.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import Foundation


protocol RepositorySearchViewInput: class {
    func showOkAlert(title: String?, text: String?)
}

protocol RepositorySearchViewOutput: class {
    func didTapSearch(text: String?)
    func didTapShowHistory()
}
