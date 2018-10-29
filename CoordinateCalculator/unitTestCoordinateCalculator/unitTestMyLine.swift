//
//  unitTestMyLine.swift
//  unitTestCoordinateCalculator
//
//  Created by 김장수 on 29/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest
import Foundation

@testable import CoordinateCalculator

class unitTestMyLine: XCTestCase {
    let myLine = MyLine(pointA: MyPoint(x: 10, y: 10), pointB: MyPoint(x: 13, y: 14))

    func testComputeMentPass() {
        // "두 점 사이의 거리는 : "
        
        let ment = myLine.computeMent()
        XCTAssertEqual(ment, "두 점 사이의 거리는 : ")
    }

    func testComputePass() {
        let distance = myLine.compute()
        XCTAssertEqual(distance, 5.0)
    }
    
    func testPointsPass() {
        let points = myLine.points
        XCTAssertNotNil(points)
    }
    
    func testFirstPointsPass() {
        let points = myLine.firstPoint()
        XCTAssertNotNil(points)
    }
}
