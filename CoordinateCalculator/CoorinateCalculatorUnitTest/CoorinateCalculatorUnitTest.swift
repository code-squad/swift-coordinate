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
        XCTAssertThrowsError(try SyntaxChecker().getErrorChekcedValue(unSupportedValue))
    }
    
    func testEliminateParenthesisMethod () {
        let withoutParenthesis = "(15,25-12-20)"
        XCTAssertThrowsError(try SyntaxChecker().getErrorChekcedValue(withoutParenthesis))
    }
    
    func testsplitInputValueByCommaMethod () {
        let withoutComma = "(15 25)-(12-20)"
        XCTAssertThrowsError(try SyntaxChecker().getErrorChekcedValue(withoutComma))
    }
    
    func testOfExceedValidInput () {
        let exceedNum = "(15,25)-(12-20)"
        XCTAssertThrowsError(try SyntaxChecker().getErrorChekcedValue(exceedNum))
    }
    
    func testIsPerpectLine () {
        let sameCoords = "(24,10)-(24,10)"
        XCTAssertThrowsError(try MakingMyShape().makeShapeInstance(sameCoords))
    }
    
    func testIsPerpectTriangle () {
        let sameCoords = "(24,10)-(16,19)-(24,10)"
        XCTAssertThrowsError(try MakingMyShape().makeShapeInstance(sameCoords))
    }
    
    func testIsSuccessMakingMyPointInstance () {
        let valinInputValue = "(24,10)-(15,10)"
        let instanceOfMyPoint = try! SyntaxChecker().getErrorChekcedValue(valinInputValue)
        XCTAssertNotNil(instanceOfMyPoint)
    }
   
    func testIsSuccessMakingMyShapeInstance () {
        let valinInputValue = "(24,10)-(15,10)"
        let instanceOfMyShape = try! MakingMyShape().makeShapeInstance(valinInputValue)
        XCTAssertNotNil(instanceOfMyShape)
    }
}
