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
        let unSupportedValue = "(aa,gg)-(ㄹㄹ-20)"
        XCTAssertThrowsError(try SyntaxChecker().checkValue(unSupportedValue))
    }
    
    func testEliminateParenthesisMethod () {
        let withoutParenthesis = "(15,25-12-20)"
        XCTAssertThrowsError(try SyntaxChecker().checkValue(withoutParenthesi))
    }
    
    func testsplitInputValueByCommaMethod () {
        let withoutComma = "(15 25)-(12-20)"
        XCTAssertThrowsError(try SyntaxChecker().checkValue(withoutComma))
    }
    
    func testOfExceedValidInput () {
        let exceedNum = "(15,25)-(12-20)"
        XCTAssertThrowsError(try SyntaxChecker().checkValue(exceedNum))
    }
    
    func testIsSuccessMakingMyPointInstance () {
        let valinInputValue = "(24,10)-(15,10)"
        let instanceOfMyPoint = try! SyntaxChecker().checkValue(valinInputValue)
        XCTAssertNotNil(instanceOfMyPoint)
    }
    
    func testPointCoordinate () {
        let input = ["11","12"]
        let testX = Int(input[0])! * 2 + 3
        let testY = abs(Int(input[1])! - 24) + 1
        let computedValue = SyntaxChecker().converToInt(input)!
        XCTAssertEqual(computedValue.x, testX)
        XCTAssertEqual(computedValue.y, testY)
    }
    
    func testIsSuccessMakingMyShapeInstance () {
        let valinInputValue = "(24,10)-(15,10)"
        let instanceOfMyShape = try! SyntaxChecker().makeCheckedValues(valinInputValue)
        XCTAssertNotNil(instanceOfMyShape)
    }
}


