//
//  UnitTestCheck.swift
//  UnitTestCoordinateCalculator
//
//  Created by 조재흥 on 26/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestCheck: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsValidCharacter1() {
        let input = "(12,14)-(10,18)"
        XCTAssertTrue(input.isValidCharacter())
    }
    
    func testIsValidCharacter2() {
        let input = "q(12,10)-v"
        XCTAssertFalse(input.isValidCharacter())
    }

    func testIsValidSize1() {
        let points = [MyPoint.init(x: 10, y: 18)]
        XCTAssertTrue(Check.isValidSize(points))
    }
    
    func testIsValidSize2() {
        let points = [MyPoint.init(x: 32, y: 10)]
        XCTAssertFalse(Check.isValidSize(points))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
