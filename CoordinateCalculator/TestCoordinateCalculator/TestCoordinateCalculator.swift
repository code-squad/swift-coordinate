//
/******************************************************************************
 * File Name        : TestCoordinateCalculator.swift
 * Description      : CoordinateCalculator
 *******************************************************************************
 * Copyright (c) 2002-2019 KineMaster Corp. All rights reserved.
 * https://www.kinemastercorp.com/
 *
 * THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
 * KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
 * PURPOSE.
 ******************************************************************************/

import XCTest

class TestCoordinateCalculator: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_InputHandler_parseToPoint() {
        let point = MyPoint(10, 20)
        let parsedPoint = InputHandler.parseToPoint("(10,20)")
        
        XCTAssertTrue(point.isEqualTo(parsedPoint))

        var wrongPoint = InputHandler.parseToPoint("aaaa")
        XCTAssertTrue(InputHandler.ErrorPoint.isEqualTo(wrongPoint))
        
        wrongPoint = InputHandler.parseToPoint("10,10,10")
        XCTAssertTrue(InputHandler.ErrorPoint.isEqualTo(wrongPoint))
        wrongPoint = InputHandler.parseToPoint("a,10")
        XCTAssertTrue(InputHandler.ErrorPoint.isEqualTo(wrongPoint))
        wrongPoint = InputHandler.parseToPoint("10,aa")
        XCTAssertTrue(InputHandler.ErrorPoint.isEqualTo(wrongPoint))
    }
    
    func test_Coordinatable_isEqual() {
        let p1 = MyPoint(3, 4)
        let p2 = MyPoint(3, 4)
        let p3 = MyPoint(3, 1)
        
        XCTAssertTrue(p1.isEqualTo(p2))
        XCTAssertFalse(p2.isEqualTo(p3))
    }
    
    func test_Coordinatable_convertTo() {
        let point = MyPoint(5,5)
        let convertedPoint = point.convertToCoodinate()
        
        XCTAssertTrue(convertedPoint.x == 12)
        XCTAssertTrue(convertedPoint.y == 20)
        
    }
    
}
