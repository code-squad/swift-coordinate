//
//  MyTriangleTests.swift
//  CoordinateCalculator
//
//  Created by sungchan.you on 2019/09/23.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class MyTriangleTests: XCTestCase {

    var triangles: [MyTriangle] = {
        
        let pointsA = [MyPoint(x: 10, y: 10), MyPoint(x: 14, y: 15), MyPoint(x: 20, y: 8)]
        let pointsB = [MyPoint(x: 5, y: 5), MyPoint(x: 10, y: 10), MyPoint(x: 20, y: 5)]
        let pointsC = [MyPoint(x: 5, y: 5), MyPoint(x: 20, y: 20), MyPoint(x: 20, y: 5)]
        
        return [ MyTriangle(pointA: pointsA[0], pointB: pointsA[1], pointC: pointsA[2]),
                 MyTriangle(pointA: pointsB[0], pointB: pointsB[1], pointC: pointsB[2]), // 150
                 MyTriangle(pointA: pointsC[0], pointB: pointsC[1], pointC: pointsC[2])]
    }()
    
    func testTriangle_return_three_vertices() {
        triangles.forEach {
            XCTAssertTrue($0.vertices.count == 3)
        }
    }
    
    
    func testTriangle_have_description() {
        triangles.forEach {
            guard $0.description != nil else {
                XCTFail()
                return
            }
        }
    }
    
    func testTriangle_can_calculate_extent() {
        triangles.forEach {
            guard $0.extent > 0 else {
                XCTFail()
                return
            }
        }
    }
}
