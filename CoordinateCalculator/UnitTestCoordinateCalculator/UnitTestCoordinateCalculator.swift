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
    var myPoint: MyPoint! = MyPoint(x: 24, y: 10)
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        myPoint = nil
    }
    
    func testSuccessInInputValueSeperation() {
        let inputValue: String = "(24,10)"
        let inputView: MyPoint! = try! InputView().splitCoordinates(inputValue)
        XCTAssertEqual(inputView.x, myPoint.x)
        XCTAssertEqual(inputView.y, myPoint.y)
    }
    
    func testFaildInInputValueSeperationIsDueToEmptyValue() {
        let inputValue: String = "()"
        XCTAssertThrowsError(try InputView().splitCoordinates(inputValue))
    }
}
