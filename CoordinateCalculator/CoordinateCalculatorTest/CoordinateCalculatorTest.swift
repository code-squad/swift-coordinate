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
        XCTAssertNoThrow(try converter.convertInput("(0,0)"))
    }
    
    func testInCorrectFormat() {
        XCTAssertThrowsError(try converter.convertInput("0,0"))
    }

    func testConsistOfTwoItem() {
        XCTAssertNoThrow(try converter.convertInput("(0,0)"))
    }

    func testNotConsistOfTwoItem() {
        XCTAssertThrowsError(try converter.convertInput("(0,0,0)"))
    }

    func testCanConvertToInt() {
        XCTAssertNoThrow(try converter.convertInput("(0,0)"))
    }

    func testCanNotConvertToInt() {
        XCTAssertThrowsError(try converter.convertInput("(zero,zero)"))
    }

    func testMoreThanZero() {
        XCTAssertNoThrow(try converter.convertInput("(0,0)"))
    }

    func testBelowZero() {
        XCTAssertThrowsError(try converter.convertInput("(-1,-1)"))
    }

    func testUnderTwentyFour() {
        XCTAssertNoThrow(try converter.convertInput("(24,24)"))
    }

    func testExcessTwentyFour() {
        XCTAssertThrowsError(try converter.convertInput("(25,25)"))
    }
}

