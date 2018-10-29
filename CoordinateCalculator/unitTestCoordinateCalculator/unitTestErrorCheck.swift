//
//  unitTestErrorCheck.swift
//  unitTestCoordinateCalculator
//
//  Created by 김장수 on 29/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest
import Foundation

@testable import CoordinateCalculator

class unitTestErrorCheck: XCTestCase {
    let errorCheck = ErrorCheck()
    
    let x = Int(arc4random_uniform(25)), y = Int(arc4random_uniform(25))
    let x1 = Int(arc4random_uniform(25)), y1 = Int(arc4random_uniform(25))
    let x2 = Int(arc4random_uniform(25)), y2 = Int(arc4random_uniform(25))
    let x3 = Int(arc4random_uniform(25)), y3 = Int(arc4random_uniform(25))
    
    // 입력값과 범위에 대한 단위 테스트
    
    func testErrorCheckPassCaseIsEmpty() {
        // 빈 값을 입력할 때 .noInput 에러 발생
        
        let pass = ""
        let errorCase = errorCheck.checkInputError(pass)
        XCTAssertEqual(errorCase, .noInput)
    }
    
    func testErrorCheckPassCasePoint() {
        // 0 ~ 24 의 값을 지닌 좌표는 에러를 생성하지 않는다.
        
        let pass = "(\(x),\(y))"
        let errorCase = errorCheck.checkInputError(pass)
        XCTAssertEqual(errorCase, .noError)
    }
    
    func testErrorCheckPassCaseLine() {
        // 0 ~ 24 의 값을 지닌 좌표는 에러를 생성하지 않는다.
        
        let pass = "(\(x),\(y))-(\(x1),\(y1))"
        let errorCase = errorCheck.checkInputError(pass)
        XCTAssertEqual(errorCase, .noError)
    }

    func testErrorCheckPassCaseTriangle() {
        // 0 ~ 24 의 값을 지닌 좌표는 에러를 생성하지 않는다.
        
        let pass = "(\(x),\(y))-(\(x1),\(y1))-(\(x2),\(y2))"
        let errorCase = errorCheck.checkInputError(pass)
        XCTAssertEqual(errorCase, .noError)
    }
    
    func testErrorCheckPassCaseRect() {
        // 0 ~ 24 의 값을 지닌 좌표는 에러를 생성하지 않는다.
        
        let pass = "(10,15)-(24,15)-(24,10)-(10,10)"
        let errorCase = errorCheck.checkInputError(pass)
        XCTAssertEqual(errorCase, .noError)
    }
    
    func testErrorCheckFailCasePoint() {
        // 0 ~ 24 밖의 값 지닌 좌표는 .outOfBound 에러 생성

        let pass = "(10,25)"
        let errorCase = errorCheck.checkInputError(pass)
        XCTAssertEqual(errorCase, .outOfBound)
    }
    
    func testErrorCheckFailCaseLine() {
        // 0 ~ 24 밖의 값 지닌 좌표는 .outOfBound 에러 생성
        
        let pass = "(10,25)-(-10,10)"
        let errorCase = errorCheck.checkInputError(pass)
        XCTAssertEqual(errorCase, .outOfBound)
    }
    
    func testErrorCheckFailCaseRect() {
        // 0 ~ 24 밖의 값 지닌 좌표는 .outOfBound 에러 생성
        
        let pass = "(10,15)-(30,15)-(30,10)-(10,10)"
        let errorCase = errorCheck.checkInputError(pass)
        XCTAssertEqual(errorCase, .outOfBound)
    }

    
    
    // 입력 형태에 따른 단위 테스트
    
    func testErrorCheckFailCaseNoComma() {
        // 콤마를 포함하지 않은 경우
        
        let pass = "(\(x)\(y)))"
        let errorCase = errorCheck.checkInputError(pass)
        XCTAssertEqual(errorCase, .breakGuideline)
    }
    
    func testErrorCheckFailCaseNoBracket() {
        // 괄호를 포함하지 않은 경우
        
        let pass = "(\(x),\(y))-(\(x1),\(y1)"
        let errorCase = errorCheck.checkInputError(pass)
        XCTAssertEqual(errorCase, .breakGuideline)
    }
    
    func testErrorCheckFailCaseUglyBracket() {
        // 괄호를 잘못 입력한 경우
        
        let pass = "(\(x),\(y))-(\(x1),\(y1))-)\(x2),\(y2)("
        let errorCase = errorCheck.checkInputError(pass)
        XCTAssertEqual(errorCase, .notCoordinates)
    }
    
    func testErrorCheckFailCaseNotNumber() {
        // 괄호를 잘못 입력한 경우
        
        let pass = "Billy"
        let errorCase = errorCheck.checkInputError(pass)
        XCTAssertEqual(errorCase, .breakGuideline)
    }
    
    func testErrorCheckFailCasePointEmpty() {
        // 괄호를 잘못 입력한 경우
        
        let pass = "(,10)"
        let errorCase = errorCheck.checkInputError(pass)
        XCTAssertEqual(errorCase, .notNumber)
    }
    
    
    
    // 직사각형이 성립되지 않는 경우
    
    func testErrorCheckFailCaseRectShape() {
        // 직사각형이 만들어지지 않는 경우

        let pass = "(10,15)-(24,14)-(24,10)-(10,10)"
        let errorCase = errorCheck.checkInputError(pass)
        XCTAssertEqual(errorCase, .notRectangle)
    }
}

