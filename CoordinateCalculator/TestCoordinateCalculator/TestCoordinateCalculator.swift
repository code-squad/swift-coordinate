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
    func testCase2_parseStringToMyPoint(){
        let expectedPoint = MyPoint(x: 10,y: 10)
        let inputLine = "(\(expectedPoint.x),\(expectedPoint.y)"
        let resultPoint = InputMenu.parseStringToPoint(inputLine: inputLine)
        XCTAssertEqual(expectedPoint, resultPoint)
    }
    
    //요구사항3 - X, Y좌표 모두 최대 24까지만 입력할 수 있다.
    func testCase3_isValidPoint(){
        let inputPoint = MyPoint(x: 25, y: 25)
        let resultValue = InputMenu.isValidPoint(checkPoint: inputPoint)
        XCTAssertFalse(resultValue)
    }
    
    //요구사항4 - 입력 범위를 초과할 경우 에러 문구를 출력하고 다시 입력을 받는다.
    func testCase4(){
        
    }
    
    //요구사항5 - 정상적인 좌표값을 입력한 경우, 해당 좌표에 특수문자를 표시한다.
    func testCase5(){
//        let inputPoint = MyPoint(x: 12, y: 13)
//        CoordinatePrinter(inputPoint).print()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
