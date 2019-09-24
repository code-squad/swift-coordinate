//
//  MyPointTests.swift
//  CoordinateCalculatorTests
//
//  Created by sungchan.you on 2019/09/21.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class MyPointTests: XCTestCase {

    var points: [MyPoint] = {
        return [MyPoint(x: 1, y: 1),
                MyPoint(x: 4, y: 8),
                MyPoint(x: 20, y: 10),
                MyPoint(x: 10, y: 20)]
    }()
    
    func testMyPoint_return_valid_coordinate() {
        let point = MyPoint(x: 10, y: 10)
        XCTAssertTrue(point.coordinate.row == 15 && point.coordinate.col == 22)
    }
    
    func testMyPoint_have_one_vertex() {
        points.forEach {
            XCTAssertTrue($0.vertices.count == 1)
        }
    }
    
    func testMyPoint_have_valid_vertex() {
        let point = MyPoint(x: 10, y:10)
        guard let coordinate = point.vertices.first?.coordinate else {
            XCTFail()
            return
        }
        XCTAssertTrue(coordinate == point.coordinate)
    }
    
    func testMyPoint_have_no_distance() {
        let point = MyPoint(x: 10, y:10)
        guard point.distance() == 0 else {
            XCTFail()
            return
        }
    }
}
