//
//  MyTriangleTest.swift
//  CoordinateCalculatorTest
//
//  Created by yangpc on 2017. 10. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import CoordinateCalculator

class MyTriangleTest: XCTestCase {
    
    var triangle1: MyTriangle!
    var triangle2: MyTriangle!
    var triangle3: MyTriangle!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        triangle1 = MyTriangle(pointA: MyPoint(x: 2, y: 4), pointB: MyPoint(x: 5, y: 1), pointC: MyPoint(x: 6, y: 9))
        triangle2 = MyTriangle(pointA: MyPoint(x: 4, y: 2), pointB: MyPoint(x: 8, y: 2), pointC: MyPoint(x: 2, y: 9))
        triangle3 = MyTriangle(pointA: MyPoint(x: 100, y: 50), pointB: MyPoint(x: 5, y: 1), pointC: MyPoint(x: 6, y: 9))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        triangle1 = nil
        triangle2 = nil
        triangle3 = nil
    }
    
    func testAreaTriangle() {
        let area1 = triangle1.areaTriangle()
        let area2 = triangle2.areaTriangle()
        let area3 = triangle3.areaTriangle()
        
        XCTAssert(area1==13.5)
        XCTAssert(area2==14.0)
        XCTAssert(area3==355.5)
    }

}
