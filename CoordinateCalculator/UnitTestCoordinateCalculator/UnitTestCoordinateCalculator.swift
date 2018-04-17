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
    
    // MAKR : Convert
    
    // Convert : 포인트 배열 얻는 정상적인 결과
    func test_CoordinatePassGetOnePointFormat() throws {
        let expectedInput = "(1,1)"
        XCTAssertNoThrow(try Converter.getMyPoints(expectedInput))
    }
    
    // Convert : 투 포인트 배열 얻는 정상적인 결과
    func test_CoordinatePassGetTwoPointFormat() throws {
        let expectedInput = "(1,1)-(1,1)"
        XCTAssertNoThrow(try Converter.getMyPoints(expectedInput))
    }
    
    // Convert : 셋 포인트 배열 얻는 정상적인 결과
    func test_CoordinatePassGetThreePointFormat() throws {
        let expectedInput = "(1,1)-(1,1)-(1,1)"
        XCTAssertNoThrow(try Converter.getMyPoints(expectedInput))
    }
    
    // Convert : 넷 포인트 배열 얻는 정상적인 결과
    func test_CoordinatePassGetFourPointFormat() throws {
        let expectedInput = "(1,1)-(1,1)-(1,1)-(1,1)"
        XCTAssertNoThrow(try Converter.getMyPoints(expectedInput))
    }
    
    // Convert : 다섯 포인트 배열부터 얻지 못하는 결과
    func test_CoordinateNoPassPointFomat() throws {
        let unExpectedInput = "(1,1)-(1,1)-(1,1)-(1,1)-(1,1)"
        let unFigure = try Converter.getMyPoints(unExpectedInput)
        XCTAssertThrowsError(try Converter.getFigure(unFigure))
    }
    
    // Convert : 포인트를 얻지 못하는 형태
    func test_CoordinateNoPassForamt() {
        let unExpectedInput = "(1,1)-(10,10,10)"
        XCTAssertThrowsError(try Converter.getMyPoints(unExpectedInput))
    }

    // Convert : 직사격형 형태가 아닌 경우
    func test_CoordinateNoPassRectFormat() throws {
        let unExpectedInput = "(1,1)-(1,1)-(1,1)-(1,1)"
        let noFigure = try Converter.getMyPoints(unExpectedInput)
        XCTAssertThrowsError(try Converter.getFigure(noFigure))
    }
    
    // Convert : 직사각형 형태인 경우
    func test_CoordinatePassRectFormat() throws {
        let expectedInput = "(10,10)-(22,10)-(22,18)-(10,18)"
        let rectMakeFomat = try Converter.getMyPoints(expectedInput)
        XCTAssertNoThrow(try Converter.getFigure(rectMakeFomat))
    }
    
    // Convert : figure 타입에서 point 얻기
    func test_CoordinateGetPointPass() throws {
        let expectedInput = "(1,1)"
        let points = try Converter.getMyPoints(expectedInput)
        let mypoint = try Converter.getFigure(points)
        
        XCTAssertEqual(mypoint as! MyPoint, MyPoint(points))
    }
    
    // Convert : figure 타입에서 line 얻기
    func test_CoordinateGetLinePass() throws {
        let expectedInput = "(1,1)-(2,2)"
        let points = try Converter.getMyPoints(expectedInput)
        let myline = try Converter.getFigure(points)
        
        XCTAssertEqual(myline as! MyLine, MyLine(points))
    }
    
    // Convert : figure 타입에서 Triangle 얻기
    func test_CoordinateGetTriangle() throws {
        let expectedInput = "(1,1)-(1,2)-(2,1)"
        let points = try Converter.getMyPoints(expectedInput)
        let mytriangle = try Converter.getFigure(points)
        
        XCTAssertEqual(mytriangle as! MyTriangle, MyTriangle(points))
    }
    
    // Convert : figure 타입에서 Rect 얻기
    func test_CoordinateGetRect() throws {
        let expectedInput = "(10,10)-(22,10)-(22,18)-(10,18)"
        let points = try Converter.getMyPoints(expectedInput)
        let myrect = try Converter.getFigure(points)
        
        XCTAssertEqual(myrect as! MyRect, MyRect(origin: MyPoint(x: 10, y: 18), size: CGSize(width: 12, height: 8)))
    }
    
}
