//
//  CoordinateCalculatorTests.swift
//  CoordinateCalculatorTests
//
//  Created by TaeHyeonLee on 2017. 10. 30..
//

import XCTest

@testable import CoordinateCalculator

class CoordinateCalculatorTests: XCTestCase {
    
    var inputView : InputView!
    var formula : String = ""
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        inputView = InputView()
        formula = "(10,10)"
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        inputView = nil
        formula = ""
    }
    /* private functions
    func testCheckInputValidataion() {
        var tmpPoint = formula.trimmingCharacters(in: ["(", ")"]).split(separator: ",")
        XCTAssertTrue(inputView.checkInputValidation(point: tmpPoint))
        formula = "[(10,10)]"
        tmpPoint = formula.trimmingCharacters(in: ["(", ")"]).split(separator: ",")
        XCTAssertFalse(inputView.checkInputValidation(point: tmpPoint))
        formula = "(25,10)"
        tmpPoint = formula.trimmingCharacters(in: ["(", ")"]).split(separator: ",")
        XCTAssertFalse(inputView.checkInputValidation(point: tmpPoint))
        
    }
    
    func testGetPoint() {
        let point = inputView.getPoint(formula: formula)
        XCTAssertEqual(point.x, 10)
        XCTAssertEqual(point.y, 10)
    }
    */
    func testGetAvailableCharacterSet() {
        XCTAssertEqual(0, "(10,10)-".trimmingCharacters(in: inputView.getAvailableCharacterSet(custom: "()-,")).count)
        XCTAssertEqual(0, "(10,10)-(14,15)".trimmingCharacters(in: inputView.getAvailableCharacterSet(custom: "()-,")).count)
        XCTAssertEqual(4, "(10,10)-test".trimmingCharacters(in: inputView.getAvailableCharacterSet(custom: "()-,")).count)
    }
}

