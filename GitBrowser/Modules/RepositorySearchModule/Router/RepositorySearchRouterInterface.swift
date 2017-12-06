//
//  RepositorySearchRouterInterface.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 02.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import Foundation

protocol RepositorySearchRouterInput {
    func openCachedRepositoryListModule()
    func openRepositoryListModule(searchText: String)
}
