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
    // 숫자가 아닌 다른 문자가 들어왔을때의 에러가 정상적으로 에러 체크 되는가
    func testcheckIsSupportedValuesMethod () {
        let unSupportedValue = "(aa,gg)-(ㄹㄹ-20)-(11,15)"
        XCTAssertThrowsError(try SyntaxChecker().getErrorChekcedValue(unSupportedValue)) { (error) -> Void in
            XCTAssertEqual(error as? SyntaxChecker.ErrorMessage , SyntaxChecker.ErrorMessage.ofValueIsNotInt)
        }
    }
    
    // 괄호가 없이 입력되었을때의 에러가 정상적으로 에러체크 되는가
    func testEliminateParenthesisMethod () {
        let withoutParenthesis = "(15,25-12-20)-(11,15)"
        XCTAssertThrowsError(try SyntaxChecker().getErrorChekcedValue(withoutParenthesis)) { (error) -> Void in
            XCTAssertEqual(error as? SyntaxChecker.ErrorMessage , SyntaxChecker.ErrorMessage.ofNonexistentParenthesis)
        }
    }
    
    // 콤마가 없을때의 에러가 정상적으로 출력되는가
    func testsplitInputValueByCommaMethod () {
        let withoutComma = "(2410)-(15,10)-(7,6)"
        XCTAssertThrowsError(try SyntaxChecker().getErrorChekcedValue(withoutComma)) { (error) -> Void in
            XCTAssertEqual(error as? SyntaxChecker.ErrorMessage , SyntaxChecker.ErrorMessage.ofNonexistenceComma)
        }
    }
    
    // 지정한 범위 24를 초과시의 에러가 정상적으로 에러체크 되는가
    func testOfExceedValidInput () {
        let exceedNum = "(15,25)-(12,20)-(11,15)"
        XCTAssertThrowsError(try SyntaxChecker().getErrorChekcedValue(exceedNum)) { (error) -> Void in
            XCTAssertEqual(error as? SyntaxChecker.ErrorMessage , SyntaxChecker.ErrorMessage.ofExceedValidInput)
        }
    }
    
    // 같은 좌표 입력시의 에러가 정상적으로 에러체크 되는가
    func testIsPerpectLine () {
        let sameCoords = "(24,10)-(24,10)"
        XCTAssertThrowsError(try MakingMyShape().makeShapeInstance(sameCoords)) { (error) -> Void in
            XCTAssertEqual(error as? MakingMyShape.ErrorMessage , MakingMyShape.ErrorMessage.ofImperfectLine)
        }
    }
    
    // 같은 좌표 입력시의 에러가 정상적으로 에러체크 되는가
    func testIsPerpectTriangle () {
        let sameCoords = "(24,10)-(16,19)-(24,10)"
        XCTAssertThrowsError(try MakingMyShape().makeShapeInstance(sameCoords)) { (error) -> Void in
            XCTAssertEqual(error as? MakingMyShape.ErrorMessage , MakingMyShape.ErrorMessage.ofImperfectTriangle)
        }
    }
    
    // 정상좌표 입력시 shape(라인)인스턴스가 생성되는가
    func testIsSuccessMakingMyPointInstance () {
        let valinInputValue = "(24,10)-(15,10)"
        let instanceOfMyPoint = try! SyntaxChecker().getErrorChekcedValue(valinInputValue)
        XCTAssertNotNil(instanceOfMyPoint)
    }
   
    // 정상좌표 입력시 인스턴스가 생성되는가
    func testIsSuccessMakingMyShapeInstance () {
        let valinInputValue = "(24,10)-(15,10)-(7,6)"
        let instanceOfMyShape = try! MakingMyShape().makeShapeInstance(valinInputValue)
        XCTAssertNotNil(instanceOfMyShape)
    }
}
