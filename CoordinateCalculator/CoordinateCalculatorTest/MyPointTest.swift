//
//  MyPointTest.swift
//  CoordinateCalculatorTest
//
//  Created by temphee.Reid on 20/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class MyPointTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_MyPoint_isInValidRange_5() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let pos = 5
        XCTAssertTrue(MyPoint.isValidInRange(pos: pos))
    }
    
    func test_MyPoint_isInValidRange_24() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let pos = 24
        XCTAssertTrue(MyPoint.isValidInRange(pos: pos))
    }
    
    func test_MyPoint_isInValidRange_25() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let pos = 25
        XCTAssertFalse(MyPoint.isValidInRange(pos: pos))
    }
    
    func test_MyPoint_isInValidRange_26() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let pos = 26
        XCTAssertFalse(MyPoint.isValidInRange(pos: pos))
    }
    
    func test_MyPoint_isInValidRange_100() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let pos = 100
        XCTAssertFalse(MyPoint.isValidInRange(pos: pos))
    }
    
    func test_MyPoint_isInValidRange_loop() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        for count in 0...100 {
            if count <= 24 {
                XCTAssertTrue(MyPoint.isValidInRange(pos: count))
            }
            else {
                XCTAssertFalse(MyPoint.isValidInRange(pos: count))
            }
        }
        
    }
    
    func test_MyPoint_xPosToShow_0() {
        let myPoint = MyPoint(x: 0, y: 0)
        let xPosToShow = myPoint.xPosToShow()
        
        XCTAssertEqual(xPosToShow, 2)
    }
    
    func test_MyPoint_xPosToShow_10() {
        let myPoint = MyPoint(x: 10, y: 0)
        let xPosToShow = myPoint.xPosToShow()
        
        XCTAssertEqual(xPosToShow, 22)
    }
    
    func test_MyPoint_xPosToShow_24() {
        let myPoint = MyPoint(x: 24, y: 0)
        let xPosToShow = myPoint.xPosToShow()
        
        XCTAssertEqual(xPosToShow, 50)
    }
    
    func test_MyPoint_yPosToShow_0() {
        let myPoint = MyPoint(x: 0, y: 0)
        let yPosToShow = myPoint.yPosToShow()
        
        XCTAssertEqual(yPosToShow, 25)
    }
    
    func test_MyPoint_yPosToShow_10() {
        let myPoint = MyPoint(x: 0, y: 10)
        let yPosToShow = myPoint.yPosToShow()
        
        XCTAssertEqual(yPosToShow, 15)
    }
    
    func test_MyPoint_yPosToShow_24() {
        let myPoint = MyPoint(x: 0, y: 24)
        let yPosToShow = myPoint.yPosToShow()
        
        XCTAssertEqual(yPosToShow, 1)
    }
    
    func test_MyPoint_getXY() {
        let myPoint = MyPoint(x: 10, y: 15)
        XCTAssertEqual(myPoint.X, 10)
        XCTAssertEqual(myPoint.Y, 15)
    }
    
    func test_MyPoint_getXYPosArrayToShow() {
        
        let myPoint = MyPoint(x: 10, y: 15)
        XCTAssertTrue(myPoint.pointToShow()[0] == (22, 10))
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
