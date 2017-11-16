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
    var myShapeCreatorTest1 = MyShapeCreator()
    var myShapeCreatorTest2 = MyShapeCreator()
    var myShapeCreatorTest3 = MyShapeCreator()
    var myShapeCreatorTest4 = MyShapeCreator()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCheckingPrintMyPointPosition() {
        let myValue = try! myShapeCreatorTest1.checkCountOfInputValue(inputValue: "(10,10)")
        let myShape = myValue.calculateOfPosition()
        XCTAssertEqual(10, myShape[0].x)
        XCTAssertEqual(10, myShape[0].y)
    }
    
    func testMyLineCheckError() {
        let myValue = try! myShapeCreatorTest2.checkCountOfInputValue(inputValue: "(10,10)-(14,15)")
        let myShape = myValue.calculateOfPosition()
        XCTAssertEqual(10, myShape[0].x)
        XCTAssertEqual(10, myShape[0].y)
        XCTAssertEqual(14, myShape[1].x)
        XCTAssertEqual(15, myShape[1].y)
    }
    
    func testMyTriangleCheckError() {
        let myValue = try! myShapeCreatorTest3.checkCountOfInputValue(inputValue: "(10,10)-(14,15)-(20,8)")
        let myShape = myValue.calculateOfPosition()
        XCTAssertEqual(10, myShape[0].x)
        XCTAssertEqual(10, myShape[0].y)
        XCTAssertEqual(14, myShape[1].x)
        XCTAssertEqual(15, myShape[1].y)
        XCTAssertEqual(20, myShape[2].x)
        XCTAssertEqual(8, myShape[2].y)
    }
    
    func testMyRectCheckError() {
        let myValue = try! myShapeCreatorTest4.checkCountOfInputValue(inputValue: "(10,10)-(22,10)-(22,18)-(10,18)")
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
