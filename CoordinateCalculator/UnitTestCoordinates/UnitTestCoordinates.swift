//
//  UnitTestCoordinates.swift
//  UnitTestCoordinates
//
//  Created by 김수현 on 2018. 3. 5..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestCoordinates: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testPointNotNil() {
        let myPointTest = MyPoint.init(x: 10, y: 10)
        let drawMyPoint = myPointTest.drawPoint()
        XCTAssertNotNil(drawMyPoint)
    }
    
    func testLineNotNil() {
        let myLineTest = MyLine.init(pointA: .init(x: 10, y: 10), pointB: .init(x: 14, y: 15))
        let drawMyLine = myLineTest.drawPoint()
        XCTAssertNotNil(drawMyLine)
    }
    
    func testTriangleNotNil() {
        let myTriangleTest = MyTriangle.init(pointA: .init(x: 10, y: 10), pointB: .init(x: 14, y: 15), pointC: .init(x: 20, y: 8))
        let drawMyTriangle = myTriangleTest.drawPoint()
        XCTAssertNotNil(drawMyTriangle)
    }
    
    func testRectNotNil() {
        let myRectTest = MyRect.init([.init(x: 10, y: 10),.init(x: 20, y: 10),.init(x: 22, y: 18),.init(x: 10, y: 18)])
        let drawMyRect = myRectTest.drawPoint()
        XCTAssertNotNil(drawMyRect)
    }
    
    func testPointEqual() {
        let myPointTest = MyPoint.init(x: 10, y: 10)
        let point = MyPoint.init(x: 10, y: 10)
        XCTAssertTrue(myPointTest == point)
        XCTAssertEqual(myPointTest, point)
    }
    
    func testLineEqual() {
        let myLineTest = MyLine.init(pointA: .init(x: 10, y: 10), pointB: .init(x: 14, y: 15))
        let line = MyLine.init(pointA: .init(x: 10, y: 10), pointB: .init(x: 14, y: 15))
        XCTAssertEqual(myLineTest, line)
    }
    
    func testTriangleEqual() {
        let myTriangleTest = MyTriangle.init(pointA: .init(x: 10, y: 10), pointB: .init(x: 14, y: 15), pointC: .init(x: 20, y: 8))
        let triangle = MyTriangle.init(pointA: .init(x: 10, y: 10), pointB: .init(x: 14, y: 15), pointC: .init(x: 20, y: 8))
        XCTAssertEqual(myTriangleTest, triangle)
    }
    
    func testRectEqual() {
        let myRectTest = MyRect.init([.init(x: 10, y: 10),.init(x: 20, y: 10),.init(x: 22, y: 18),.init(x: 10, y: 18)])
        let rect = MyRect.init([.init(x: 10, y: 10),.init(x: 20, y: 10),.init(x: 22, y: 18),.init(x: 10, y: 18)])
        XCTAssertEqual(myRectTest, rect)
    }
    
    func testLineCalculate() {
        let myLineTest = MyLine.init(pointA: .init(x: 10, y: 10), pointB: .init(x: 14, y: 15))
        let lineCalculate = myLineTest.calculate()
        let x = Double(myLineTest.pointA.x - myLineTest.pointB.x)
        let y = Double(myLineTest.pointA.y - myLineTest.pointB.y)
        let distance = sqrt(Double(pow(x, 2) + Double(pow(y, 2))))
        XCTAssert(lineCalculate == ("두 점 사이의 거리는 ", distance))
    }
    
    func testTriangleCalculate() {
        let myTriangleTest = MyTriangle.init(pointA: .init(x: 10, y: 10), pointB: .init(x: 14, y: 15), pointC: .init(x: 20, y: 8))
        let triangleCalculate = myTriangleTest.calculate()
        let a = myTriangleTest.lineBC.calculate()
        let b = myTriangleTest.lineAC.calculate()
        let c = myTriangleTest.lineAB.calculate()
        let cos = (pow(a.1, 2) + pow(c.1, 2) - pow(b.1, 2)) / (2 * a.1 * c.1)
        let sin = sqrt(1 - pow(cos, 2))
        let area = 0.5 * a.1 * c.1 * sin
        XCTAssert(triangleCalculate == ("삼각형 넓이는 ",area))
    }
    
    func testRectCalculate() {
        let myRectTest = MyRect.init([.init(x: 10, y: 10),.init(x: 20, y: 10),.init(x: 22, y: 18),.init(x: 10, y: 18)])
        let rectCalculate = myRectTest.calculate()
        let area = Double((myRectTest.leftTop.x-myRectTest.rightTop.x) * (myRectTest.leftTop.y-myRectTest.leftBottom.y))
        XCTAssert(rectCalculate == ("사각형 넓이는 ", area))
    }
    
    func testIsRect() {
        let myRectTest = MyRect.init([.init(x: 10, y: 10),.init(x: 20, y: 10),.init(x: 22, y: 18),.init(x: 10, y: 18)])
        let isRect = myRectTest.isRectangle()
        XCTAssertTrue(isRect)
    }
    
    func testisVaildInput() {
        let grammarCheckerTest = GrammarChecker()
        let check = grammarCheckerTest.isVaildInput("(10,10)")
        XCTAssertTrue(check)
    }
    
    func testIsUnderNumber() {
        let grammarCheckerTest = GrammarChecker()
        let check = grammarCheckerTest.isUnderNumber([.init(x: 25, y: 24), .init(x: 1, y: 2), .init(x: 3, y: 3), .init(x: 5, y: 10)])
        XCTAssertFalse(check)
    }
    
}
