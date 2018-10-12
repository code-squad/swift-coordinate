//
//  UnitTestInput.swift
//  UnitTestInput
//
//  Created by 윤지영 on 05/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestTextValidator: XCTestCase {
    let validForm = "(10,9)"
    let noBracket = "10,9)"
    let noComma = "(424)"
    let noTwoValue = "(12,)"
    let notInt = "(q,2)"
    let outOfRange = "(29,3)"

    override func setUp() {}

    override func tearDown() {}
    
    func testInputHasNoInvalidCharacter() {
        XCTAssertTrue(TextValidator(text:validForm).hasNoInvalidCharacter())
    }
    
    func testInputHasInvalidCharacter() {
        XCTAssertFalse(TextValidator(text:notInt).hasNoInvalidCharacter())
    }
    
    func testInputHasNoError() {
        XCTAssertEqual(TextValidator(text:validForm).checkTextError(), .success)
    }
    
    func testInputHasBrackets() {
        XCTAssertEqual(TextValidator(text:noBracket).checkTextError(), .invalidForm)
    }
    
    func testInputHasOneComma() {
        XCTAssertEqual(TextValidator(text:noComma).checkTextError(), .noOneComma)
    }
    
    func testInputHasTwoValues() {
        XCTAssertEqual(TextValidator.init(text:noTwoValue).checkTextError(), .noBothXY)
    }
    
    func testInputIsIntType() {
        XCTAssertEqual(TextValidator.init(text:notInt).checkTextError(), .outOfRangeInt)
    }
    
    func testInputIsNotOutOfRange() {
        XCTAssertEqual(TextValidator.init(text:outOfRange).checkTextError(), .outOfRangeInt)
    }
}
