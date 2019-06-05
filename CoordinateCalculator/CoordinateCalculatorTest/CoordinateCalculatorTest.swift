//
//  CoordinateCalculatorTest.swift
//  CoordinateCalculatorTest
//
//  Created by 이희찬 on 15/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class CoordinateCalculatorTest: XCTestCase {
    var verification: Validator!
    override func setUp() {
        verification = Validator()
    }
    
    func testCorrectFormat() {
        XCTAssertNoThrow(try verification.verifyInput("(0,0)"))
    }
    
    func testInCorrectFormat() {
        XCTAssertThrowsError(try verification.verifyInput("0,0"))
    }
    
    func testConsistOfTwoItem() {
        XCTAssertNoThrow(try verification.verifyInput("(0,0)"))
    }
    
    func testNotConsistOfTwoItem() {
        XCTAssertThrowsError(try verification.verifyInput("(0,0,0)"))
    }
    
    func testCanConvertToInt() {
        XCTAssertNoThrow(try verification.verifyInput("(0,0)"))
    }
    
    func testCanNotConvertToInt() {
        XCTAssertThrowsError(try verification.verifyInput("(zero,zero)"))
    }
    
    func testMoreThanZero() {
        XCTAssertNoThrow(try verification.verifyInput("(0,0)"))
    }
    
    func testBelowZero() {
        XCTAssertThrowsError(try verification.verifyInput("(-1,-1)"))
    }
    
    func testUnderTwentyFour() {
        XCTAssertNoThrow(try verification.verifyInput("(24,24)"))
    }
    
    func testExcessTwentyFour() {
        XCTAssertThrowsError(try verification.verifyInput("(25,25)"))
    }
}

