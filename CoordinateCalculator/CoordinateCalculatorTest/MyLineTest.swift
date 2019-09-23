//
//  MyLineTest.swift
//  CoordinateCalculatorTest
//
//  Created by temphee.Reid on 23/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class MyLineTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_MyLine_init_returns_nil_when_two_points_are_same() {
        guard let myLine = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0)) else {
            XCTAssert(true)
            return
        }
    }
    
    func test_MyLine_init_success() {
        guard let myLine = MyLine(pointA: MyPoint(x: 0, y: 1), pointB: MyPoint(x: 0, y: 0)) else {
            XCTFail()
            return
        }
        
        XCTAssert(true)
    }
    
    func test_MyLine_getXYPosArrayToShow() {
        guard let myLine = MyLine(pointA: MyPoint(x: 0, y: 1), pointB: MyPoint(x: 10, y: 5)) else {
            XCTFail()
            return
        }
        
        let xyPosArray = myLine.pointToShow()
        
        XCTAssertTrue(xyPosArray[0] == (2,24))
        XCTAssertTrue(xyPosArray[1] == (22,20))
    }
    
   

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
