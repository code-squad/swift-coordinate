//
//  UnitTestCoordinateCalculator.swift
//  UnitTestCoordinateCalculator
//
//  Created by yuaming on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import XCTest

@testable import CoordinateCalculator

class UnitTestCoordinateCalculator: XCTestCase {
    var myPoint: MyPoint = MyPoint(x: 24, y: 10)
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSuccessInInputValueSeperation() {
        let inputValue = "(24, 10)"
        let splitInputValue = try! UtilSet.splitInputValue(in: inputValue)
        XCTAssertEqual(splitInputValue.x, myPoint.x)
        XCTAssertEqual(splitInputValue.y, myPoint.y)
    }

    func testFaildInInputValueSeperationIsDueToEmptyValue() {
        let inputValue = "()"
        XCTAssertThrowsError(try UtilSet.splitInputValue(in: inputValue))
    }
}
