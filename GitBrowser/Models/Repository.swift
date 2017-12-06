//
//  Repository.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 02.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import Foundation

struct Repository {
    let name: String
    let description: String?
    let stars: Int
    let isViewed: Bool
    
    init(repositoryPlainModel: RepositoryPlainModel, withTruncate length: Int?) {
        name = repositoryPlainModel.name.truncate(length: length)
        description = repositoryPlainModel.description?.truncate(length: length)
        stars = repositoryPlainModel.starsCount
        isViewed = false
    }
    
    init(repositoryObject: RepositoryObject, withTruncate length: Int?) {
        name = repositoryObject.name.truncate(length: length)
        description = repositoryObject.descriptionInfo?.truncate(length: length)
        stars = Int(repositoryObject.starsCount)
        isViewed = repositoryObject.isViewed
    }
}
