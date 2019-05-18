//
//  CoordinateCalculatorTest.swift
//  CoordinateCalculatorTest
//
//  Created by 이희찬 on 15/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class CoordinateCalculatorTest: XCTestCase {
    var converter: Converter!
    override func setUp() {
        converter = Converter()
    }
    
    func testCorrectFormat() {
        XCTAssertNoThrow(try converter.convertInput("(0,0)",Validator()))
    }
    
    func testInCorrectFormat() {
        XCTAssertThrowsError(try converter.convertInput("0,0",Validator()))
    }

    func testConsistOfTwoItem() {
        XCTAssertNoThrow(try converter.convertInput("(0,0)",Validator()))
    }

    func testNotConsistOfTwoItem() {
        XCTAssertThrowsError(try converter.convertInput("(0,0,0)",Validator()))
    }

    func testCanConvertToInt() {
        XCTAssertNoThrow(try converter.convertInput("(0,0)",Validator()))
    }

    func testCanNotConvertToInt() {
        XCTAssertThrowsError(try converter.convertInput("(zero,zero)",Validator()))
    }

    func testMoreThanZero() {
        XCTAssertNoThrow(try converter.convertInput("(0,0)",Validator()))
    }

    func testBelowZero() {
        XCTAssertThrowsError(try converter.convertInput("(-1,-1)",Validator()))
    }

    func testUnderTwentyFour() {
        XCTAssertNoThrow(try converter.convertInput("(24,24)",Validator()))
    }

    func testExcessTwentyFour() {
        XCTAssertThrowsError(try converter.convertInput("(25,25)",Validator()))
    }
}

