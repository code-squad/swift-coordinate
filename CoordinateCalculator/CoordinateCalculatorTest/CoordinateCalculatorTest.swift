//
//  CoordinateCalculatorTest.swift
//  CoordinateCalculatorTest
//
//  Created by 이희찬 on 21/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class CoordinateCalculatorTest: XCTestCase {
    var converter: Converter!
    override func setUp() {
        converter = Converter()
    }
    
    func testCorrectFormat() {
        XCTAssertNoThrow(try converter.converterChoice("(0,0)"))
    }
    
    func testCorrectFormatOfLine() {
        XCTAssertNoThrow(try converter.converterChoice("(0,0)-(0,0)"))
    }
    
    func testInCorrectFormat() {
        XCTAssertThrowsError(try converter.converterChoice("0,0"))
    }
    
    func testInCorrectFormatOfLine() {
        XCTAssertThrowsError(try converter.converterChoice("(0,0)(0,0)"))
    }
    
    func testConsistOfTwoItem() {
        XCTAssertNoThrow(try converter.converterChoice("(0,0)"))
    }
    
    func testNotConsistOfTwoItem() {
        XCTAssertThrowsError(try converter.converterChoice("(0,0,0)"))
    }
    
    func testCanConvertToInt() {
        XCTAssertNoThrow(try converter.converterChoice("(0,0)"))
    }
    
    func testCanNotConvertToInt() {
        XCTAssertThrowsError(try converter.converterChoice("(zero,zero)"))
    }
    
    func testMoreThanZero() {
        XCTAssertNoThrow(try converter.converterChoice("(0,0)"))
    }
    
    func testBelowZero() {
        XCTAssertThrowsError(try converter.converterChoice("(-1,-1)"))
    }
    
    func testUnderTwentyFour() {
        XCTAssertNoThrow(try converter.converterChoice("(24,24)"))
    }
    
    func testExcessTwentyFour() {
        XCTAssertThrowsError(try converter.converterChoice("(25,25)"))
    }
}
