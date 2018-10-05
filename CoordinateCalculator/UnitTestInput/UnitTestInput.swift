//
//  UnitTestInput.swift
//  UnitTestInput
//
//  Created by 윤지영 on 05/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestInput: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let input = "(10,10)"
        XCTAssertTrue(input.firstIndex(of:",") == input.lastIndex(of:","))
        let input2 = "(10,10,)"
        XCTAssertFalse(input2.firstIndex(of:",") == input2.lastIndex(of:","))
        let input3 = "(1010)"
        XCTAssertTrue(input3.firstIndex(of:",") == input3.lastIndex(of:","))
    }


}
