//
//  LiteralPointValidatorTests.swift
//  CoordinateCalculatorTests
//
//  Created by sungchan.you on 2019/09/21.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class LiteralPointValidatorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLiteralPointValidater_valid_string_return_true() {
        let validator = LiteralPointValidator()
        let strings = ["(0,0)", "(0,24)", "(24,24)", "(10,10)", "(24,0)"]
        strings.forEach {
            XCTAssertTrue(validator.isValid(userInput: $0))
        }
    }
    
    func testLiteralPointValidater_string_exceeding_boundary_return_false() {
        let validator = LiteralPointValidator()
        let strings = ["(-1,24)", "(0,25)", "(25,0)", "(24,-1)"]
        strings.forEach {
            XCTAssertFalse(validator.isValid(userInput: $0))
        }
    }
    
    func testLiteralPointValidater_string_invalid_format_return_false() {
        let validator = LiteralPointValidator()
        let strings = ["(0,  0)", "(024)", "(24-24)", "(10??10)", "(24,,0)", "(20,20)(10,10)"]
        strings.forEach {
            XCTAssertFalse(validator.isValid(userInput: $0))
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
