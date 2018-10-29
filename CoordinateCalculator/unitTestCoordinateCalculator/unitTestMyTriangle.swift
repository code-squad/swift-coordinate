//
//  unitTestMyTriangle.swift
//  unitTestCoordinateCalculator
//
//  Created by 김장수 on 29/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest
import Foundation

@testable import CoordinateCalculator

class unitTestMyTriangle: XCTestCase {
    let myTri = MyTriangle(pointA: MyPoint(x: 10,y: 10), pointB: MyPoint(x: 14, y: 15), pointC: MyPoint(x: 20, y: 8))
    
    func testComputeMentPass() {
        // "삼각형의 넓이는 : "
        let ment =  myTri.computeMent()
        XCTAssertEqual(ment, "삼각형의 넓이는 : ")
    }
    
    func testComputePass() {
        let width = myTri.compute()
        XCTAssertEqual(width, 29.001)
    }
    
    func testPointsPass() {
        let points = myTri.points
        XCTAssertNotNil(points)
    }
}
