//
//  RepositoryDetailModuleInteractor.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 05.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//
//

import UIKit

class RepositoryDetailModuleInteractor {

    //MARK: - Properties
    weak var output: RepositoryDetailModuleInteractorOutput?
    lazy var repositoriesService: RepositoriesCachedService = RepositoriesCachedServiceImpl()
}

extension RepositoryDetailModuleInteractor: RepositoryDetailModuleInteractorInput {
    
    func markAsViewed(repositoryId: Int32?) {
        guard let _repositoryId = repositoryId else { return }
        repositoriesService.markAsViewed(id: _repositoryId)
    }
}
