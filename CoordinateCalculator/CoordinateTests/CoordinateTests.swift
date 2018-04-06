//
//  CoordinateTests.swift
//  CoordinateTests
//
//  Created by moon on 2018. 4. 1..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import CoordinateCalculator

class CoordinateTests: XCTestCase {
    
    var inputScanner: InputScanner!
    
    override func setUp() {
        super.setUp()
        
        inputScanner = InputScanner()
    }
    
    override func tearDown() {
        super.tearDown()
        
        inputScanner = nil
    }

    // Input test
    func testMinimumInputCoordinatePassTest() {
        let testText = "(1,1)"
        XCTAssertEqual(try inputScanner.scan(text: testText, pattern: InputScanner.validPattern), testText)
    }
    
    func testMaximumInputCoordinatePassTest() {
        let testText = "(24,24)"
        XCTAssertEqual(try inputScanner.scan(text: testText, pattern: InputScanner.validPattern), testText)
    }
    
    func testBiggerCoordinateXInputTest() {
        let testText = "(25,1)"
        XCTAssertThrowsError(try inputScanner.scan(text: testText, pattern: InputScanner.validPattern))
    }
    
    func testBiggerCoordinateYInputTest() {
        let testText = "(1,25)"
        XCTAssertThrowsError(try inputScanner.scan(text: testText, pattern: InputScanner.validPattern))
    }
    
    func testSmallerCoordinateXInputTest() {
        let testText = "(0,1)"
        XCTAssertThrowsError(try inputScanner.scan(text: testText, pattern: InputScanner.validPattern))
    }
    
    func testSmallerCoordinateYInputTest() {
        let testText = "(1,0)"
        XCTAssertThrowsError(try inputScanner.scan(text: testText, pattern: InputScanner.validPattern))
    }
    
    ///////////////////////////////////////////
    
    func testInvalidFormatInput() {
        let testText = "((10,10))"
        XCTAssertThrowsError(try inputScanner.scan(text: testText, pattern: InputScanner.validPattern))
    }
    
    func testInvalidBracketFormatInput() {
        let testText = "{10,10}"
        XCTAssertThrowsError(try inputScanner.scan(text: testText, pattern: InputScanner.validPattern))
    }
    
    func testNoBracketInput() {
        let testText = "10,10"
        XCTAssertThrowsError(try inputScanner.scan(text: testText, pattern: InputScanner.validPattern))
    }
    
    func testEmptyInput() {
        let testText = ""
        XCTAssertThrowsError(try inputScanner.scan(text: testText, pattern: InputScanner.validPattern))
    }
    
    
    // Coordinate test
    func testGetCoordinate() {
        let coordinate = inputScanner.getCoordinateFrom(text: "(10,10)")

        XCTAssertEqual(coordinate, [10, 10])
    }
    
    func testMakePointFromCoordinate() {
        let expectedMyPoint = MyPoint(x: 7, y: 7)
        let testCoordinate = [7, 7]
        let testMyPoint = inputScanner.makeMyPointFrom(coordinates: testCoordinate)
        
        XCTAssertEqual(expectedMyPoint.x, testMyPoint.x)
        XCTAssertEqual(expectedMyPoint.y, testMyPoint.y)
    }
    
    func testMyPointEquatable() {
        let expectedMyPoint = MyPoint(x: 7, y: 7)
        let testCoordinate = [7, 7]
        let testMyPoint = inputScanner.makeMyPointFrom(coordinates: testCoordinate)
        
        XCTAssertEqual(expectedMyPoint, testMyPoint)
    }
    
}
