//
//  MyTriangleTest.swift
//  CoordinateCalculatorTest
//
//  Created by temphee.Reid on 23/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class MyTriangleTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_MyTriangle_init() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let triangle = MyTriangle(
            pointA: MyPoint(point: (23,4)),
            pointB: MyPoint(point: (4,5)),
            pointC: MyPoint(point: (6,12)) )
        
        
        XCTAssertNotNil(triangle)
    }
    
    func test_MyTriangle_init_nill_same_points() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let triangle = MyTriangle(
            pointA: MyPoint(point: (23,4)),
            pointB: MyPoint(point: (23,4)),
            pointC: MyPoint(point: (6,12)) )
        
        
        XCTAssertNil(triangle)
    }
    
    func test_MyTriangle_pointToShow() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let triangle = MyTriangle(
            pointA: MyPoint(point: (23,6)),
            pointB: MyPoint(point: (24,4)),
            pointC: MyPoint(point: (6,12)) )
        
        
        guard let points = triangle?.pointToShow() else {
            XCTFail()
            return
        }
        
        print(points)
        
        XCTAssertTrue(points[0] == (48, 19))
        XCTAssertTrue(points[1] == (50, 21))
        XCTAssertTrue(points[2] == (14, 13))
    }
    
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
