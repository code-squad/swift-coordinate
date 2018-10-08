//
//  UnitTestMyPoint.swift
//  UnitTestInput
//
//  Created by 윤지영 on 08/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestMyPoint: XCTestCase {
    let validString = "15"
    let validStringToInt = 15
    let outOfRangeString = "25"
    let outOfRangeStringToInt = 25
    let notInt = "p"
    let negativeInt = "-5"
    let defaultMyPoint = MyPoint()

    override func setUp() {}
    override func tearDown() {}

    func testMyPointInitializedWell_WithValidInt() {
        let myPoint = MyPoint(x:validString, y:validString)
        XCTAssertTrue(myPoint.x==validStringToInt && myPoint.y==validStringToInt)
    }
    
    func testMyPointInitializedToDefault_WithNegativeInt() {
        let myPoint = MyPoint(x:negativeInt, y:validString)
        XCTAssertTrue(myPoint.x==defaultMyPoint.x && myPoint.y==defaultMyPoint.y)
    }
    
    func testMyPointInitializedToDefault_WithNotInt() {
        let myPoint = MyPoint(x:notInt, y:validString)
        XCTAssertTrue(myPoint.x==defaultMyPoint.x && myPoint.y==defaultMyPoint.y)
    }
    
    func testMyPointInitializedToDefault_WithOutOfRangeInt() {
        let myPoint = MyPoint(x:outOfRangeString, y:validString)
        XCTAssertTrue(myPoint.x==defaultMyPoint.x && myPoint.y==defaultMyPoint.y)
    }
}
