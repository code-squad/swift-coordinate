//
//  UnitTestCoordinates.swift
//  UnitTestCoordinates
//
//  Created by 김수현 on 2018. 3. 5..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestCoordinates: XCTestCase {
    
    var myPointTest: MyPoint?
    var myLineTest: MyLine?
    var myTriangleTest: MyTriangle?
    var myRectTest: MyRect?
    var grammarCheckerTest: GrammarChecker?
    
    override func setUp() {
        super.setUp()
        myPointTest = MyPoint.init(x: 10, y: 10)
        myLineTest = MyLine.init(pointA: .init(x: 10, y: 10), pointB: .init(x: 14, y: 15))
        myTriangleTest = MyTriangle.init(pointA: .init(x: 10, y: 10), pointB: .init(x: 14, y: 15), pointC: .init(x: 20, y: 8))
        myRectTest = MyRect.init([.init(x: 10, y: 10),.init(x: 20, y: 10),.init(x: 22, y: 18),.init(x: 10, y: 18)])
    }
    
    func testDrawShape() {
        let drawMyPoint = myPointTest?.drawPoint()
        let drawMyLine = myLineTest?.drawPoint()
        let drawMyTriangle = myTriangleTest?.drawPoint()
        let drawMyRect = myRectTest?.drawPoint()
        XCTAssertNotNil(drawMyPoint)
        XCTAssertNotNil(drawMyLine)
        XCTAssertNotNil(drawMyTriangle)
        XCTAssertNotNil(drawMyRect)
    }
    
    func testCalculate() {
        let calculateLine = myLineTest?.calculate()
        let calculateTriangle = myTriangleTest?.calculate()
        let calculateRect = myRectTest?.calculate()
        XCTAssertNotNil(calculateLine)
        XCTAssertNotNil(calculateTriangle)
        XCTAssertNotNil(calculateRect)
    }
    
    func testIsRect() {
        let isRect = myRectTest?.isRectangle()
        XCTAssertTrue(isRect!)
    }
    
    func testisVaildInput() {
        guard let check = grammarCheckerTest?.isVaildInput("(10,10)") else { return }
        XCTAssertTrue(check)
    }
    
    func testIsUnderNumber() {
        guard let check = grammarCheckerTest?.isUnderNumber([.init(x: 25, y: 24), .init(x: 1, y: 2), .init(x: 3, y: 3), .init(x: 5, y: 10)]) else { return }
        XCTAssertFalse(check)
    }
    
}

