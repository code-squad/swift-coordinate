//
//  UnitTestCoordinateCalculator.swift
//  UnitTestCoordinateCalculator
//
//  Created by JINA on 26/12/2018.
//  Copyright © 2018 JINA KIM. All rights reserved.
//

import XCTest
@testable import coordinateCalculator

class UnitTestCheckInput: XCTestCase {
    func testIsInputableDot() {
        let input = "(10.10)"
        let inputNum:[Int?] = [10,10]
        XCTAssertEqual(ErrorMessage.reEntered, CheckInput.validData(input, inputNum))
    }
    
    func testIsInputableBrace() {
        let input = "{10,10}"
        let inputNum:[Int?] = [10,10]
        XCTAssertEqual(ErrorMessage.reEntered, CheckInput.validData(input, inputNum))
    }
    
    func testNumRange() {
        let input = "(10,25)"
        let inputNum:[Int?] = [10,25]
        XCTAssertEqual(ErrorMessage.outOfRange, CheckInput.validData(input, inputNum))
    }
    
    func testCanBecomeRect() {
        let input = "(10,10,22,10,22,18,10,18)"
        let inputNum:[Int?] = [10,10,22,10,22,18,10,18]
        XCTAssertEqual(ErrorMessage.notErr, CheckInput.validData(input, inputNum))
    }
    
    func testCannotBecomeRect() {
        let input = "(10,10,22,10,22,18,10,10)"
        let inputNum:[Int?] = [10,10,22,10,22,18,10,10]
        XCTAssertEqual(ErrorMessage.notRect, CheckInput.validData(input, inputNum))
    }
}
