//
//  CoordinateTests.swift
//  CoordinateTests
//
//  Created by Elena on 17/12/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import CoordinateCalculator

class CoordinateTests: XCTestCase {
  
    override func setUp() { }
    override func tearDown() { }
 
    func testTextValidatorisValidData() {
        let validData = "(10,9)"
        XCTAssertTrue(TextValidator(text: validData).isValidPoint())
    }
    
    func testTextValidatorisNoInvalidCharacter() {
        let noValidData = "(A,1)"
        XCTAssertFalse(TextValidator(text: noValidData).isValidPoint())
    }
    
    func testTextValidatorisBrackets() {
        let noValidData = "10,1)"
        XCTAssertFalse(TextValidator(text: noValidData).isValidPoint())
    }
    
    func testTextValidatorisRangePoint() {
        let noValidData = -1
        XCTAssertFalse(TextValidator.init(text: "(1,1)").isRangePoint(num: noValidData))
    }
    // StringProcessing
    func testStringProcessingisDividePoint() {
        let coordianteString = "(3,4)"
        let point = StringProcessing.dividePoint(from: coordianteString)
        let isPoint = MyPoint(x: 3, y: 4)
        XCTAssertTrue(point.x == isPoint.x && point.y == isPoint.y)
    }
    
    func testStringProcessingisNoDividePoint() {
        let coordianteString = ""
        let point = StringProcessing.dividePoint(from: coordianteString)
        let isPoint = MyPoint(x: 3, y: 4)
        XCTAssertFalse(point.x == isPoint.x && point.y == isPoint.y)
    }
    // RectValidator
    
    let vaildRect = [MyPoint(x:2,y:0),MyPoint(x:0,y:2),MyPoint(x:2,y:4),MyPoint(x:4,y:2)]
    let invaildRect = [MyPoint(x:17,y:10),MyPoint(x:22,y:10),MyPoint(x:22,y:18),MyPoint(x:10,y:17)]
    
    func testvaildRect() {
        XCTAssertTrue(RectValidator().isRectDiagonal(vaildRect))
    }
    func testNoVaildRect() {
        XCTAssertFalse(RectValidator().isRectDiagonal(invaildRect))
    }
}
