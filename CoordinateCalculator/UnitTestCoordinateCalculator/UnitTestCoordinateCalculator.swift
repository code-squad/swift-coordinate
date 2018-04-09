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
    
     //MARK : Spliter
    
    // Spliter : 정상적으로 결과
    func test_CoordinateSpliterSaveFormatPass() {
        let expectedInput = "1,1"
        let splitCount = Spliter.splitSaveFormat(expectedInput).count
        XCTAssertTrue(splitCount == 2)
    }
    
    // Spliter : 잘 못 된 결과
    func test_CoordinateSaveFormateNoPass() {
        let expectedInput = "11"
        let splitCount = Spliter.splitSaveFormat(expectedInput).count
        XCTAssertFalse(splitCount == 2)
    }
}
