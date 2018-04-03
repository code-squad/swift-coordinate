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

    // 정상 입력 체크
    func testInputScan() {
        inputScanner = InputScanner()
        let testInputText = "(10,10)"
        
        let scannedText: String = try! inputScanner.scan(text: testInputText, pattern: InputScanner.validPattern)
        XCTAssertEqual(scannedText, testInputText)
    }
    
    func testInvalidFormatInput() {
        inputScanner = InputScanner()
        let testInputText = "((10,10))"
        XCTAssertThrowsError(try inputScanner.scan(text: testInputText, pattern: InputScanner.validPattern))
    }
    
    func testInvalidNumberInput() {
        inputScanner = InputScanner()
        let testInputText = "(24, 10)"
        XCTAssertThrowsError(try inputScanner.scan(text: testInputText, pattern: InputScanner.validPattern))
    }
    
    
    
}
