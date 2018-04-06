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

    func testInputScan() {
        let testText = "(10,10)"
        
        let scannedText: String = try! inputScanner.scan(text: testText, pattern: InputScanner.validPattern)
        XCTAssertEqual(scannedText, testText)
    }
    
    func testInvalidFormatInput() {
        let testText = "((10,10))"
        XCTAssertThrowsError(try inputScanner.scan(text: testText, pattern: InputScanner.validPattern))
    }
    
    func testInvalidNumberInput() {
        let testText = "(24, 10)"
        XCTAssertThrowsError(try inputScanner.scan(text: testText, pattern: InputScanner.validPattern))
    }
    
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
