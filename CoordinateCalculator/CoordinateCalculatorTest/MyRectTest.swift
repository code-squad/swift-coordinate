//
//  MyRectTest.swift
//  CoordinateCalculatorTest
//
//  Created by temphee.Reid on 24/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class MyRectTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_MyRect_init_wit_top_bottom_area() {
        let rect = MyRect(leftTop: MyPoint(x: 10, y: 10), rightBottom: MyPoint(x: 15, y: 5))
        
        XCTAssertEqual(rect.area(), 25)
        
        
    }
    
    func test_MyRect_init_with_size_area() {
        let rect = MyRect(origin: MyPoint(x: 10, y: 10), size: CGSize(width: 10, height: 10))
        
        XCTAssertEqual(rect.area(), 100)
        
    }
    
    func test_MyRect_pointToShow() {

        let rect = MyRect(origin: MyPoint(x: 10, y: 10), size: CGSize(width: 10, height: 10))
        
        let points = rect.pointToShow()
        
        
        XCTAssertTrue(points[0] == (22, 15))
        XCTAssertTrue(points[1] == (42, 25))
        XCTAssertTrue(points[2] == (22, 25))
        XCTAssertTrue(points[3] == (42, 15))
    
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
