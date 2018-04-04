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
    }
    
    override func tearDown() {
        super.tearDown()
        
        inputScanner = nil
    }

    func testInputScan() {
        inputScanner = InputScanner()
        let testText = "(10,10)"
        
        let scannedText: String = try! inputScanner.scan(text: testInputText, pattern: InputScanner.validPattern)
        XCTAssertEqual(scannedText, testText)
    }
    
    func testInvalidFormatInput() {
        inputScanner = InputScanner()
        let testText = "((10,10))"
        XCTAssertThrowsError(try inputScanner.scan(text: testInputText, pattern: InputScanner.validPattern))
    }
    
    func testInvalidNumberInput() {
        inputScanner = InputScanner()
        let testText = "(24, 10)"
        XCTAssertThrowsError(try inputScanner.scan(text: testText, pattern: InputScanner.validPattern))
    }
    
    func testGetCoordinate() {
        inputScanner = InputScanner()
        let coordinate = inputScanner.getCoordinateFrom(text: "(10,10)")

        XCTAssertEqual(coordinate, [10, 10])
    }
    
    
}
