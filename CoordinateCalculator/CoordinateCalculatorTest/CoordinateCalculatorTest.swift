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
    
    func testCorrectFormatOfPoint() {
        XCTAssertNoThrow(try converter.converterChoice("(0,0)"))
    }
    
    func testCorrectFormatOfLine() {
        XCTAssertNoThrow(try converter.converterChoice("(0,0)-(0,0)"))
    }
    
    func testInCorrectFormatOfPoint() {
        XCTAssertThrowsError(try converter.converterChoice("0,0"))
    }
    
    func testInCorrectFormatOfLine() {
        XCTAssertThrowsError(try converter.converterChoice("(0,0)(0,0)"))
    }
    
    func testLineNotConsistOfThreeItem() {
        XCTAssertThrowsError(try converter.converterChoice("(0,0)-(0,0)-(0,0)"))
    }
    
    func testLineNotConsistOfOneItem() {
        XCTAssertThrowsError(try converter.converterChoice("(0,0)-"))
    }
    
    func testCoordinateConsistOfTwoItem() {
        XCTAssertNoThrow(try converter.converterChoice("(0,0)"))
    }
    
    func testCoordinateNotConsistOfTwoItem() {
        XCTAssertThrowsError(try converter.converterChoice("(0,0,0)"))
    }
    
    func testCoordinateCanConvertToInt() {
        XCTAssertNoThrow(try converter.converterChoice("(0,0)"))
    }
    
    func testCoordinateCanNotConvertToInt() {
        XCTAssertThrowsError(try converter.converterChoice("(zero,zero)"))
    }
    
    func testCoordinateMoreThanZero() {
        XCTAssertNoThrow(try converter.converterChoice("(0,0)"))
    }
    
    func testCoordinateBelowZero() {
        XCTAssertThrowsError(try converter.converterChoice("(-1,-1)"))
    }
    
    func testCoordinateUnderTwentyFour() {
        XCTAssertNoThrow(try converter.converterChoice("(24,24)"))
    }
    
    func testCoordinateExcessTwentyFour() {
        XCTAssertThrowsError(try converter.converterChoice("(25,25)"))
    }
}
