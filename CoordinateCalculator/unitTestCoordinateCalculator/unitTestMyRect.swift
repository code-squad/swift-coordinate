//
//  unitTestMyRect.swift
//  unitTestCoordinateCalculator
//
//  Created by 김장수 on 29/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest
import Foundation

@testable import CoordinateCalculator

class unitTestMyRect: XCTestCase {

    let myRect = MyRect(origin: MyPoint(x: 10, y: 10), size: CGSize(width: 12, height: 8))
    
    func testComputeMentPass() {
        // "삼각형의 넓이는 : "
        let ment =  myRect.computeMent()
        XCTAssertEqual(ment, "사각형의 넓이는 : ")
    }
    
    func testComputePass() {
        let width = myRect.compute()
        XCTAssertEqual(width, 96.0)
    }
    
    func testPointsPass() {
        let points = myRect.points
        XCTAssertNotNil(points)
    }

}
