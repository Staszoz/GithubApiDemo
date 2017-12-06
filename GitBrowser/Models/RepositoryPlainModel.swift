//
//  RepositoryPlainModel.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 02.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import Foundation


class RepositoryPlainModel: Codable, Equatable {
    var id: Int
    var name: String
    var url: String?
    var starsCount: Int
    var description: String?
    
    enum CodingKeys : String, CodingKey {
        case id
        case description
        case name = "full_name"
        case url = "html_url"
        case starsCount = "stargazers_count"
    }
    
    init(id: Int, name: String, url: String?, starsCount: Int, description: String?) {
        self.id = id
        self.name = name
        self.url = url
        self.starsCount = starsCount
        self.description = description
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        url = try values.decode(String?.self, forKey: .url)
        starsCount = try values.decode(Int.self, forKey: .starsCount)
        description = try values.decode(String?.self, forKey: .description)
    }
    
    init(repositoryObject: RepositoryObject) {
        id = Int(repositoryObject.uid)
        name = repositoryObject.name
        url = repositoryObject.url
        starsCount = Int(repositoryObject.starsCount)
        description = repositoryObject.descriptionInfo
    }
}


func ==(lhs:RepositoryPlainModel, hrs:RepositoryPlainModel) -> Bool {
    if lhs.id == hrs.id, lhs.name == hrs.name, lhs.url == hrs.url, lhs.starsCount == hrs.starsCount, lhs.description == hrs.description {
        return true
    }
    return false
}
