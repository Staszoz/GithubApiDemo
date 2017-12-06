//
//  GithubApiConstants.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 02.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import Foundation


struct GithubApi {
    
    static let BaseURL = "https://api.github.com"
    
    enum Endpoint {
        case searchRepositories
        
        public var path: String {
            var endpoint: String
            switch self {
            case .searchRepositories:
                endpoint = "/search/repositories"
            }
            
            return GithubApi.BaseURL + endpoint
        }
    }
    
    enum SortKey {
        static let stars = "stars"
    }
    
    enum ParamKey {
        static let searchTekt = "q"
        static let sort = "sort"
        static let page = "page"
        static let perPage = "per_page"
    }
}




