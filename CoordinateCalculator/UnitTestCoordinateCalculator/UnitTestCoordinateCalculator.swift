//
//  UnitTestCoordinateCalculator.swift
//  UnitTestCoordinateCalculator
//
//  Created by Eunjin Kim on 2017. 11. 16..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import CoordinateCalculator
class UnitTestCoordinateCalculator: XCTestCase {
    var inputViewTest1 = InputView()
    var inputViewTest2 = InputView()
    var inputViewTest3 = InputView()
    var inputViewTest4 = InputView()
    let x1 = 10, y1 = 10
    let x2 = 14, y2 = 15
    let x3 = 20, y3 = 8
    let x4 = 10, y4 = 18
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCheckingPrintMyPointPosition() {
        let myValue = try! inputViewTest1.checkCountOfInputValue(inputValue: "(10,10)")
        let myShape = myValue.calculateOfPosition()
        XCTAssertEqual(10, myShape[0].x)
        XCTAssertEqual(10, myShape[0].y)
    }
    
    func testMyLineCheckError() {
        let myValue = try! inputViewTest2.checkCountOfInputValue(inputValue: "(10,10)-(14,15)")
        let myShape = myValue.calculateOfPosition()
        XCTAssertEqual(10, myShape[0].x)
        XCTAssertEqual(10, myShape[0].y)
        XCTAssertEqual(14, myShape[1].x)
        XCTAssertEqual(15, myShape[1].y)
    }
    
    func testMyTriangleCheckError() {
        let myValue = try! inputViewTest3.checkCountOfInputValue(inputValue: "(10,10)-(14,15)-(20,8)")
        let myShape = myValue.calculateOfPosition()
        XCTAssertEqual(10, myShape[0].x)
        XCTAssertEqual(10, myShape[0].y)
        XCTAssertEqual(14, myShape[1].x)
        XCTAssertEqual(15, myShape[1].y)
        XCTAssertEqual(20, myShape[2].x)
        XCTAssertEqual(8, myShape[2].y)
    }
    
    func testMyRectCheckError() {
        let myValue = try! inputViewTest4.checkCountOfInputValue(inputValue: "(10,10)-(22,10)-(22,18)-(10,18)")
        let myShape = myValue.calculateOfPosition()
        XCTAssertEqual(10, myShape[0].x)
        XCTAssertEqual(10, myShape[0].y)
        XCTAssertEqual(10, myShape[1].x)
        XCTAssertEqual(18, myShape[1].y)
        XCTAssertEqual(22, myShape[2].x)
        XCTAssertEqual(18, myShape[2].y)
        XCTAssertEqual(22, myShape[3].x)
        XCTAssertEqual(10, myShape[3].y)
    }
    
    func testPerformanceExample() {

    }
    
}
