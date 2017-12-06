//
//  GitBrowserUnitTests.swift
//  GitBrowserUnitTests
//
//  Created by Станислав Калиберов on 06.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import XCTest
@testable import GitBrowser

class StringTruncateTests: XCTestCase {
    
    let defaultStringLenght = 30

    func testTruncateLongString() {
        let longString = String(Array(repeating: "q", count: 100))
        let cuttedString = longString.truncate(length: defaultStringLenght, trailing: "")

        XCTAssertEqual(cuttedString.count, defaultStringLenght)
    }
    
    func testTruncateShortString() {
        let shortString = String(Array(repeating: "q", count: 10))
        let cuttedString = shortString.truncate(length: defaultStringLenght, trailing: "")
        
        XCTAssertLessThanOrEqual(cuttedString.count, 10)
    }
    
    func testTruncateEmptyString() {
        let emptyString = ""
        let cuttedString = emptyString.truncate(length: defaultStringLenght, trailing: "")
        
        XCTAssertEqual(cuttedString.count, 0)
    }
    
    func testTruncateNilString() {
        let emptyString: String? = nil
        let cuttedString = emptyString?.truncate(length: defaultStringLenght, trailing: "")
        
        XCTAssertNil(cuttedString)
    }
    
}
