//
//  UnitTestInput.swift
//  UnitTestInput
//
//  Created by 윤지영 on 05/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestInput: XCTestCase {
    let validForm = "(10,9)"
    let noBracket = "10,9)"
    let noComma = "(424)"
    let noTwoValue = "(12,)"
    let notInt = "(q,2)"
    let outOfRange = "(29,3)"

    override func setUp() {}

    override func tearDown() {}
    
    func testInputHasNoError() {
        XCTAssertEqual(InputValidator(input:validForm).checkInputError(), .noError)
    }
    
    func testInputHasBrackets() {
        XCTAssertEqual(InputValidator.init(input:noBracket).checkInputError(), .invalidForm)
    }
    
    func testInputHasOneComma() {
        XCTAssertEqual(InputValidator(input:noComma).checkInputError(), .invalidForm)
    }
    
    func testInputHasTwoValues() {
        XCTAssertEqual(InputValidator.init(input:noTwoValue).checkInputError(), .invalidForm)
    }
    
    func testInputIsIntType() {
        XCTAssertEqual(InputValidator.init(input:notInt).checkInputError(), .outOfRangeInt)
    }
    
    func testInputIsNotOutOfRange() {
        XCTAssertEqual(InputValidator.init(input:outOfRange).checkInputError(), .outOfRangeInt)
    }
}
