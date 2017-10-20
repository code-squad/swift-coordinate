//
//  MyRectTest.swift
//  CoordinateCalculatorTest
//
//  Created by yangpc on 2017. 10. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import CoordinateCalculator

class MyRectTest: XCTestCase {

    var rect1: MyRect!
    var rect2: MyRect!
    var rect3: MyRect!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        rect1 = MyRect(leftTop: MyPoint(x: 10, y: 80), rightBottom: MyPoint(x: 45, y: 50))
        rect2 = MyRect(leftTop: MyPoint(x: 3434, y: 5050), rightBottom: MyPoint(x: 9090, y: 1011))
        rect3 = MyRect(leftTop: MyPoint(x: 4, y: 8888), rightBottom: MyPoint(x: 999, y: 5050))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        rect1 = nil
        rect2 = nil
        rect3 = nil
    }
    
    func testAreaRect() {
        let area1 = rect1.areaRect()
        let area2 = rect2.areaRect()
        let area3 = rect3.areaRect()
        XCTAssert(area1==1050)
        XCTAssert(area2==22844584)
        XCTAssert(area3==3818810.0)
    }
}
