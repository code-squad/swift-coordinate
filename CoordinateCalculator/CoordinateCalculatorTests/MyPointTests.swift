//
//  MyPointTests.swift
//  CoordinateCalculatorTests
//
//  Created by sungchan.you on 2019/09/21.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class MyPointTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMyPoint_can_init_with_string() {
        let strings = ["(0,0)", "-19,-22", "(10,10)", "-11,22"]
        strings.forEach {
            let point = MyPoint(string: $0)
            XCTAssertNotNil(point)
        }
    }
    
    func testMyPoint_should_return_nil_with_invalid_string() {
        let strings = ["(00)", "apgro", "(10$$$0)", "한글", "", "-12,,22"]
        strings.forEach {
            let point = MyPoint(string: $0)
            XCTAssertNil(point)
        }
    }
    
    func testMyPoint_should_return_coordinate() {
        let point = MyPoint(string: "(10,10)")
        let coordinate = point?.coordinate
        XCTAssertTrue(coordinate?.row == 15 && coordinate?.col == 22)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
