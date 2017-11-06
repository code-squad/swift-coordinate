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
    var myPoint: MyPonit? = MyPonit(x: 20, y: 10)
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        myPoint = nil
    }
    
    func testSuccessInInputValueSeperation() {
        let inputValue: String = "(20,10)"
        XCTAssertEqual(try InputView().splitInputValue(inputValue), ["(20", "10)"])
    }
    
    func testFaildInInputValueSeperationIsDueToEmptyValue() {
        let inputValue: String = "()"
        XCTAssertThrowsError(try InputView().splitInputValue(inputValue))
    }
    
    func testSuccessInCoordinateSerperation() {
        let inputValue: [String] = ["(20", "10)"]
        XCTAssertEqual(try InputView().splitXYCoordinates(inputValue)?.x, myPoint!.x)
        XCTAssertEqual(try InputView().splitXYCoordinates(inputValue)?.y, myPoint!.y)
    }
    
    func testFailedInCoordinateSerperationIsDueToEmptyValue() {
        let inputValue: [String] = []
        XCTAssertThrowsError(try InputView().splitXYCoordinates(inputValue))
    }
    
    func testFailedInCoordinateSerperationIsDueToOutOfRange() {
        let inputValue: [String] = ["(10","100)"]
        XCTAssertThrowsError(try InputView().splitXYCoordinates(inputValue))
    }
}
