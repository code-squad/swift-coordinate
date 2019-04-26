//
//  CoordinateCalculatorTest.swift
//  CoordinateCalculatorTest
//
//  Created by joon-ho kil on 4/26/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class CoordinateCalculatorTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMyTriangle () {
        let triangle = MyTriangle(pointA: MyPoint(x: 10, y: 11), pointB: MyPoint(x: 13, y: 14), pointC: MyPoint(x: 5, y: 3))
        XCTAssertEqual(4.499999999999925, triangle.area)
        
        let pointA = MyPoint(x: 10, y: 11)
        let pointB = MyPoint(x: 13, y: 14)
        let pointC = MyPoint(x: 5, y: 3)
        
        XCTAssertEqual(triangle.lineAB.pointA, pointA)
        XCTAssertEqual(triangle.lineAB.pointB, pointB)
        XCTAssertEqual(triangle.lineAC.pointB, pointC)
        
        XCTAssertEqual(triangle.lineAB, MyLine(pointA: pointA, pointB: pointB))
        XCTAssertEqual(triangle.lineAC, MyLine(pointA: pointA, pointB: pointC))
        XCTAssertEqual(triangle.lineBC, MyLine(pointA: pointB, pointB: pointC))
        
        XCTAssertEqual([pointA, pointB, pointC], triangle.draw())
        
        XCTAssertEqual(triangle.getMent(), ["삼각형의 넓이는": 4.499999999999925])
    }
    
    func testMyRect () {
        let rect = MyRect(origin: MyPoint(x: 5, y: 5), size: CGSize(width: 10, height: 10))
        XCTAssertEqual(100, rect.area)
        
        XCTAssertEqual(rect.leftTop, MyPoint(x: 5, y: 5))
        XCTAssertEqual(rect.rightBottom, MyPoint(x: 15, y: 15))
        
        XCTAssertEqual([MyPoint(x: 5, y: 5), MyPoint(x: 5, y: 15), MyPoint(x: 15, y: 5), MyPoint(x: 15, y: 15)], rect.draw())
        
        XCTAssertEqual(rect.getMent(), ["사각형 넓이는": 100])
    }
}
