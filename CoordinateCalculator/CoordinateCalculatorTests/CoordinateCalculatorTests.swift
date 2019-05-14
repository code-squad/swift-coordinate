//
//  CoordinateCalculatorTests.swift
//  CoordinateCalculatorTests
//
//  Created by JieunKim on 14/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class CoordinateCalculatorTests: XCTestCase {

    func testValidatorFormatToSuccess(){
        let validator = Validator()
        XCTAssertNoThrow(try validator.validateFormat(input: "(10,10)"))
    }
    
    func testValidatorFormatToFail(){
        let validator = Validator()
        XCTAssertThrowsError(try validator.validateFormat(input: "지은이"))
    }
    
    func testValidatorFormatToFail2(){
        let validator = Validator()
        XCTAssertThrowsError(try validator.validateFormat(input: "(a,a"))
    }
    
    func testValidatorFormatToFail3(){
        let validator = Validator()
        XCTAssertThrowsError(try validator.validateFormat(input: "(a,a)"))
    }
    
    func testValidatorRangeToSuccess(){
        let validator = Validator()
        XCTAssertNoThrow(try validator.validateRange(number: 10))
    }
    
    func testValidatorRangeToFail(){
        let validator = Validator()
        XCTAssertThrowsError(try validator.validateRange(number: 100))
        XCTAssertThrowsError(try validator.validateRange(number: -1))
    }

}
