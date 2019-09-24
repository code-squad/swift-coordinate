//
//  TestCoordinateCalculator.swift
//  TestCoordinateCalculator
//
//  Created by RENO1 on 23/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class TestCoordinateCalculator: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // 요구사항1 - 사용자가 점에 대한 좌표 정보를 입력하는 메뉴를 구성한다.
    // 좌표를 입력하세요.
    // (10,10)
    func testCase1_askPoint(){
        
    }
    
    //요구사항2 - 좌표 정보는 괄호"(", ")"로 둘러쌓여 있으며 쉼표(,)로 x값과 y값을 구분한다.
    //요구사항2' - InputView 구조체에서 입력가능한 CharacterSet을 만들어서 입력된 문자열 중에 입력할 수 없는 문자가 포함되어 있는지 비교한다. 입력 불가능한 문자가 포함된 경우 다시 입력받는다.
    func testCase2_isValidInputLine_validInputLine(){
        let inputPoint = MyPoint(x: 10,y: 10)
        let isValid = Validation.isValidInputLine(inputLine: inputPoint.description)//InputMenu.createPoint(inputLine: inputLine)
        XCTAssertTrue(isValid, inputPoint.description)
    }
    
    //요구사항3 - X, Y좌표 모두 최대 24까지만 입력할 수 있다.
    func testCase3_isValidInputLine_validInputLine2(){
        let inputPoint = MyPoint(x: 24, y: 24)
        let isValid = Validation.isValidInputLine(inputLine: inputPoint.description)
        XCTAssertTrue(isValid, inputPoint.description)
    }
    
    //요구사항4 - 입력 범위를 초과할 경우 에러 문구를 출력하고 다시 입력을 받는다.
    func testCase4_isValidPoint_inValidCase_OverMaxValue(){
        let inputPoint = MyPoint(x: 25, y: 25)
        let isInValid = Validation.isValidInputLine(inputLine: inputPoint.description)
        XCTAssertFalse(isInValid, typeFixedPoint.description)
    }
    
    //요구사항5 - 정상적인 좌표값을 입력한 경우, 해당 좌표에 특수문자를 표시한다.
    func testCase5_extension_cursor_move(){
        let inputPoint = MyPoint(x: 12, y: 13)
        let expectedPoint = ANSICode.cursor.move(row: 25 - inputPoint.getY(), col: inputPoint.getX() * 2 + 2)
        let resultPoint = ANSICode.cursor.move(point: inputPoint)
        XCTAssertEqual(expectedPoint, resultPoint)
    }
    
    //요구사항6 - 생성할 때 두 점이 같은 점이면 생성하지 않고 nil을 반환한다.
    
    //요구사항7 - MyLine 구조체에는 두 점 사이의 거리를 계산하는 함수를 구현한다.
    func testCase7_calculateLineLength() {
        let expectedDistance = 1
        let pointA = MyPoint(x: 1, y: 1)
        let pointB = MyPoint(x: 2, y: 1)
        let inputLine = MyLine(point1: pointA, point2: pointB)
        let resultDistance = inputLine.calculateLineLength()
        
        XCTAssertEqual(expectedDistance, Int(resultDistance))
    }
    //요구사항8 - 좌표가 그려진 아래 27번째 줄에는 두 점 사이 거리를 계산해서 출력한다.

}
