//
//  MyLineTests.swift
//  CoordinateCalculatorTests
//
//  Created by sungchan.you on 2019/09/21.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class MyLineTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    var lines: [MyLine] = {
        return [ MyLine(x: MyPoint(x: 10, y: 0), y: MyPoint(x: 5, y: 1)),
                 MyLine(x: MyPoint(x: 5, y: 1), y: MyPoint(x: 4, y: 3)),
                 MyLine(x: MyPoint(x: 2, y: 22), y: MyPoint(x: 17, y: 0)),
                 MyLine(x: MyPoint(x: 13, y: 13), y: MyPoint(x: 19, y: 20))]
    }()
    
    func testMyLine_return_two_vertices() {
        lines.forEach {
            XCTAssertTrue($0.vertices.count == 2)
        }
    }
    
    func testMyLine_have_description() {
        lines.forEach {
            guard $0.description != nil else {
                XCTFail()
                return
            }
        }
    }
    
    func testMyLine_can_calculate_distance() {
        lines.forEach {
            guard $0.distance > 0 else {
                XCTFail()
                return
            }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
