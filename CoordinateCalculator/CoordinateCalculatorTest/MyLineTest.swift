//
//  MyLineTest.swift
//  CoordinateCalculatorTest
//
//  Created by yangpc on 2017. 10. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import CoordinateCalculator

class MyLineTest: XCTestCase {

    var line1: MyLine!
    var line2: MyLine!
    var line3: MyLine!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        line1 = MyLine(pointA: MyPoint(x: 1, y: 3), pointB: MyPoint(x: 4, y: 3))
        line2 = MyLine(pointA: MyPoint(x: 2, y: 5), pointB: MyPoint(x: 6, y: 8))
        line3 = MyLine(pointA: MyPoint(x: 100, y: 30), pointB: MyPoint(x: 20, y: 80))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        line1 = nil
        line2 = nil
        line3 = nil
    }

    func testDistance() {
        let distance1 = line1.distance()
        let distance2 = line2.distance()
        let distance3 = line3.distance()
        
        XCTAssert(distance1==3.0)
        XCTAssert(distance2==5.0)
        XCTAssert(distance3==94.33981132)
    }
}
