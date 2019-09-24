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

    func test_InputHandler_makePoint() {
        let processor = InputProcessor()
        let point = MyPoint(10, 20)
        
        var parsedPoint: Coodinatable?
        XCTAssertNoThrow(parsedPoint = try processor.makePoint("(10,20)"))
        XCTAssertTrue(point.isEqualTo(parsedPoint!))

        XCTAssertThrowsError(try processor.makePoint("aaaa"))
        
        XCTAssertThrowsError(try processor.makePoint("10,10,10"))
        XCTAssertThrowsError(try processor.makePoint("a,10"))
        XCTAssertThrowsError(try processor.makePoint("10,aa"))

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
