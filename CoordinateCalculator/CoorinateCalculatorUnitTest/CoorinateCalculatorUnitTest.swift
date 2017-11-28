//
//  CoorinateCalculatorUnitTest.swift
//  CoorinateCalculatorUnitTest
//
//  Created by Choi Jeong Hoon on 2017. 11. 28..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import CoordinateCalculator

class CoorinateCalculatorUnitTest: XCTestCase {
    
    func testcheckIsSupportedValuesMethod () {
        let input = "(aa,gg)-(ㄹㄹ-20)"
        XCTAssertThrowsError(try SyntaxChecker().checkValue(input))
    }
    
    func testEliminateParenthesisMethod () {
        let input = "(15,25-12-20)"
        XCTAssertThrowsError(try SyntaxChecker().checkValue(input))
    }
    
    func testsplitInputValueByCommaMethod () {
        let input = "(15 25)-(12-20)"
        XCTAssertThrowsError(try SyntaxChecker().checkValue(input))
    }
    
    func testOfExceedValidInput () {
        let input = "(15,25)-(12-20)"
        XCTAssertThrowsError(try SyntaxChecker().checkValue(input))
    }
    
    func testIsSuccessMakingMyPointInstance () {
        let inputValue = "(24,10)-(15,10)"
        let splitInputValue = try! SyntaxChecker().checkValue(inputValue)
        XCTAssertNotNil(splitInputValue)
    }
    
    func test () {
        let input = ["11","12"]
        let x = Int(input[0])! * 2 + 3
        let y = abs(Int(input[1])! - 24) + 1
        let inputValue = SyntaxChecker().converToInt(input)!
        XCTAssertEqual(inputValue.x, x)
        XCTAssertEqual(inputValue.y, y)
    }
    
    func testIsSuccessMakingMyShapeInstance () {
        let inputValue = "(24,10)-(15,10)"
        let splitInputValue = try! SyntaxChecker().makeCheckedValues(inputValue)
        XCTAssertNotNil(splitInputValue)
    }
}


