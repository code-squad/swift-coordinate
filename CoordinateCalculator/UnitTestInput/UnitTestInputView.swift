//
//  UnitTestInputView.swift
//  UnitTestInput
//
//  Created by 윤지영 on 08/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestInputView: XCTestCase {
    let noValue = "(,)"
    let noTwoValue = "(12,)"
    let twoValues = "(10,9)"

    override func setUp() {}
    override func tearDown() {}
    
    func testSeparateCoordinate_OfNoValueInput_IntoArray() {
        XCTAssertEqual(InputView.separateCoordinate(input:noValue).count, 0)
    }
    
    func testSeparateCoordinate_OfOneValueInput_IntoArray() {
        XCTAssertEqual(InputView.separateCoordinate(input:noTwoValue).count, 1)
    }
    
    func testSeparateCoordinate_OfTwoValuesInput_IntoArray() {
        XCTAssertEqual(InputView.separateCoordinate(input:twoValues).count, 2)
    }
    
    func testGetCoordinateX() {
        XCTAssertEqual(InputView.getCoordinate(input:twoValues).x, "10")
    }
    
    func testGetCoordinateY() {
        XCTAssertEqual(InputView.getCoordinate(input:twoValues).y, "9")
    }
}
