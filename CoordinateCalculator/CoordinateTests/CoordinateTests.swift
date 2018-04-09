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
    
    var inputChecker: InputChecker!
    var figureMaker: FigureMaker!
    
    override func setUp() {
        super.setUp()
        
        inputChecker = InputChecker()
        figureMaker = FigureMaker()
    }
    
    override func tearDown() {
        super.tearDown()
        
        inputChecker = nil
        figureMaker = nil
    }

    // Input test
    func testMinimumInputCoordinatePassTest() {
        let testText = "(1,1)"
        XCTAssertEqual(try inputChecker.checkMatching(text: testText, with: InputChecker.validPattern), testText)
    }
    
    func testMaximumInputCoordinatePassTest() {
        let testText = "(24,24)"
        XCTAssertEqual(try inputChecker.checkMatching(text: testText, with: InputChecker.validPattern), testText)
    }
    
    func testBiggerCoordinateXInputTest() {
        let testText = "(25,1)"
        XCTAssertThrowsError(try inputChecker.checkMatching(text: testText, with: InputChecker.validPattern))
    }
    
    func testBiggerCoordinateYInputTest() {
        let testText = "(1,25)"
        XCTAssertThrowsError(try inputChecker.checkMatching(text: testText, with: InputChecker.validPattern))
    }
    
    func testSmallerCoordinateXInputTest() {
        let testText = "(0,1)"
        XCTAssertThrowsError(try inputChecker.checkMatching(text: testText, with: InputChecker.validPattern))
    }
    
    func testSmallerCoordinateYInputTest() {
        let testText = "(1,0)"
        XCTAssertThrowsError(try inputChecker.checkMatching(text: testText, with: InputChecker.validPattern))
    }
    
    func testInvalidFormatInput() {
        let testText = "((10,10))"
        XCTAssertThrowsError(try inputChecker.checkMatching(text: testText, with: InputChecker.validPattern))
    }
    
    func testInvalidBracketFormatInput() {
        let testText = "{10,10}"
        XCTAssertThrowsError(try inputChecker.checkMatching(text: testText, with: InputChecker.validPattern))
    }
    
    func testNoBracketInput() {
        let testText = "10,10"
        XCTAssertThrowsError(try inputChecker.checkMatching(text: testText, with: InputChecker.validPattern))
    }
    
    func testEmptyInput() {
        let testText = ""
        XCTAssertThrowsError(try inputChecker.checkMatching(text: testText, with: InputChecker.validPattern))
    }
    
    
    // Coordinate test
    func testGetCoordinate() {
        let coordinate = figureMaker.getCoordinateFrom(text: "(10,10)")
        XCTAssertEqual(coordinate, [10, 10])
    }
    
    func testMakePointFromCoordinate() {
        let expectedMyPoint = MyPoint(x: 7, y: 7)
        let testCoordinate = [7, 7]
        let testMyPoint = figureMaker.makeMyPointFrom(coordinates: testCoordinate)
        
        XCTAssertEqual(expectedMyPoint.x, testMyPoint.x)
        XCTAssertEqual(expectedMyPoint.y, testMyPoint.y)
    }
    
    func testMyPointEquatable() {
        let expectedMyPoint = MyPoint(x: 7, y: 7)
        let testCoordinate = [7, 7]
        let testMyPoint = figureMaker.makeMyPointFrom(coordinates: testCoordinate)
        
        XCTAssertEqual(expectedMyPoint, testMyPoint)
    }
    
    // step3
    func testReadInputWithInvalidCharacter() {
        let invalidInput = "(10,10)-(14,15)*"
        
        XCTAssertTrue(InputView.hasInvalidCharacter(in: invalidInput))
    }
    
    func testReadInputWithValidCharacter() {
        let invalidInput = "(10,10)-(14,15)"
        
        XCTAssertFalse(InputView.hasInvalidCharacter(in: invalidInput))
    }
}
