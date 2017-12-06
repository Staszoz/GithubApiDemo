//
//  RepositoryPlainModel.swift
//  GitBrowserUnitTests
//
//  Created by Станислав Калиберов on 06.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import XCTest
@testable import GitBrowser


let mockResponse: [String:Any] = [
    "id": 3,
    "full_name": "tetris",
    "html_url": "https://github.com/tetris",
    "description": "Play tetris in your terminal - in color",
    "stargazers_count": 100
]

class RepositoryPlainModelTest: XCTestCase {
    
    func testJSONMapping() {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: mockResponse, options: .prettyPrinted) else {
            XCTFail("Missing json data")
            return
        }
        
        let repository = RepositoryPlainModel(id: 3,
                                              name: "tetris",
                                              url: "https://github.com/tetris",
                                              starsCount: 100,
                                              description: "Play tetris in your terminal - in color")
        
        let decoder = JSONDecoder()
        do {
            let repositoryMapped = try decoder.decode(RepositoryPlainModel.self, from: jsonData)
            XCTAssertEqual(repositoryMapped, repository)
            
        } catch {
            XCTFail("Mapping is fail")
        }
    }
}
