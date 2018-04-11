//
//  UnitTestCoordinateCalculator.swift
//  UnitTestCoordinateCalculator
//
//  Created by Jung seoung Yeo on 2018. 4. 3..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import CoordinateCalculator

class UnitTestCoordinateCalculator: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK : 입력
    
    // inputViewChecker : (1,1)
    func test_CoordinateFirstNumberPass() {
        let expectedInput = "(1,1)"
        XCTAssertNoThrow(try InputViewChecker.formatChekcer(checkerFormat: expectedInput))
    }

    // inputViewChecker : (24,24)
    func test_CoordinateMaxNumberPass() {
        let expectedInput = "(24,24)"
        XCTAssertNoThrow(try InputViewChecker.formatChekcer(checkerFormat: expectedInput))
    }
    
    // inputViewChcker : x좌표 25이상 입력
    func test_CoordinateXMuximumOverBound() {
        let expectedInput = "(25,1)"
        XCTAssertThrowsError(try InputViewChecker.formatChekcer(checkerFormat: expectedInput))
    }
    
    // inputViewChcker : x좌표 0이하 입력
    func test_CoordinateXMinimumOverBound() {
        let expectedInput = "(-1,1)"
        XCTAssertThrowsError(try InputViewChecker.formatChekcer(checkerFormat: expectedInput))
    }
    
    // inputVieChecker : y좌표 25이상 입력
    func test_CoordinateYMaximumOverBound() {
        let expectedInput = "(1,25)"
        XCTAssertThrowsError(try InputViewChecker.formatChekcer(checkerFormat: expectedInput))
    }
    
    // inputVieChcker : y좌표 1이하 입력
    func test_CoordinateYMinimumOverBound() {
        let expectedInput = "(1,-1)"
        XCTAssertThrowsError(try InputViewChecker.formatChekcer(checkerFormat: expectedInput))
    }
    
    // inputViewChecker : 잘못된 입력 형식
    func test_CoordinateUnexpectedInput() {
        let unExpectedInput = "askdfhksdhkfhskldfhkshkl"
        XCTAssertThrowsError(try InputViewChecker.formatChekcer(checkerFormat: unExpectedInput))
    }
    
    // inputVieChecker : 입력 가능한 문자
    func test_CoordinatePossibleInput() {
        let expetedInput = "0123456789(),-"
        XCTAssertNoThrow(try InputViewChecker.validInputChecker(expetedInput))
    }
    
    // inputViewChecker : 입력 불가능한 문자를 포함
    func test_CoordinateImPossibleInput() {
        let unExpectedInput = "(1,1)-+1sdfjklseo>?:~!"
        XCTAssertThrowsError(try InputViewChecker.validInputChecker(unExpectedInput))
    }
    
    // inputViewChecker : 두 좌표 입력 형식
    func test_CoordinateDoublePointPassFormat() {
        let expectedInput = "(1,1)-(1,1)"
        XCTAssertNoThrow(try InputViewChecker.formatChekcer(checkerFormat: expectedInput))
    }
    
    // inputViewChecker : 두 좌표 입력 형식 x
    func test_CoordinateDoublePointNoPassFormat() {
        let unExpectedInput = "(1,1)-(1,1)-"
        XCTAssertThrowsError(try InputViewChecker.formatChekcer(checkerFormat: unExpectedInput))
    }
    
     //MARK : Spliter

    // spliter : 정상적으로 split
    func test_CoordinateSpliterFormatPass() {
        let expectedInput = "1,1"
        XCTAssertNoThrow(try Spliter.splitSaveFormat(expectedInput))
    }
    
    // spliter : 비정상적인 X좌표
    func test_CoordinateSpliterNoPassX() {
        let unExpectedInput = "1-,1"
        XCTAssertThrowsError(try Spliter.splitSaveFormat(unExpectedInput))
    }
    
    // spliter : 비정상적인 Y좌표
    func test_CoordinateSpliterNoPassY() {
        let unExpectedInput = "1,1-"
        XCTAssertThrowsError(try Spliter.splitSaveFormat(unExpectedInput))
    }
    
    // Spliter : 정상적으로 결과
    func test_CoordinateSpliterSaveFormatPass() throws {
        let expectedInput = "1,1"
        let splitCount = try Spliter.splitSaveFormat(expectedInput).count
        XCTAssertTrue(splitCount == 2)
    }

    // Spliter : 비저상적인 결과
    func test_CoordinateSaveFormateNoPass() {
        let unExpectedInput = "11"
       XCTAssertThrowsError(try Spliter.splitSaveFormat(unExpectedInput))
    }
    
    // MKEK String+
    
    // String+ : point key NoFormat
    func test_CoordinateNotPointFormat() {
        let unExpectedInput = "(1,1)-(1,1)"
        XCTAssertNotEqual(try unExpectedInput.getProcessKey(), CoordKey.Point)
    }
    
    // String+ : point key 얻기
    func test_CoordinateGetKeyPointPass() {
        let expectedInput = "(1,1)"
        XCTAssertEqual(try expectedInput.getProcessKey(), CoordKey.Point)
    }
    
    // String+ : Line Key 얻기
    func test_CoordinateGetKeyLinePass() {
        let expectedInput = "(1,1)-(1,1)"
        XCTAssertEqual(try expectedInput.getProcessKey(), CoordKey.Line)
    }
    
    // String+ : Line key NoFormat
    func test_CoordinateNoLineForamt() {
        let unExpectedInput = "(1,1)"
        XCTAssertNotEqual(try unExpectedInput.getProcessKey(), CoordKey.Line)
    }
}
