//
//  PointCheckerTests.swift
//  CoordinateCalculatorTests
//
//  Created by 공명진 on 2019/09/22.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class PointCheckerTests: XCTestCase {
    
    let checker = PointChecker()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testWrongPointCountError() {
        XCTAssertThrowsError(try checker.checkPoint(formular: "(2,2,2)"))
        XCTAssertThrowsError(try checker.checkPoint(formular: "(2,)"))
        XCTAssertThrowsError(try checker.checkPoint(formular: "(,2)"))
    }
    
    func testInvalidRangeError() {
        XCTAssertThrowsError(try checker.checkPoint(formular: "(2,30)"))
        XCTAssertThrowsError(try checker.checkPoint(formular: "(30,2)"))
    }
    
    func testInvalidFormatError() {
        XCTAssertThrowsError(try checker.checkPoint(formular: "(2,2)A"))
        XCTAssertThrowsError(try checker.checkPoint(formular: "[2,2]"))
    }

}
