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
        inputView = InputView()
        formula = "(10,10)"
    }
    
    override func tearDown() {
        super.tearDown()
        inputView = nil
        formula = ""
    }
    /* private functions
    func testGetPoint() {
        let point = inputView.getPoint(formula: formula)
        XCTAssertEqual(point[0].x, 10)
        XCTAssertEqual(point[0].y, 10)
    }
    
    func testGetPoints() {
        var points = inputView.getPoints(inputPoints: ["(10,10)","(14,15)"])
        XCTAssertEqual(points[0].x, 10)
        XCTAssertEqual(points[0].y, 10)
        XCTAssertEqual(points[1].x, 14)
        XCTAssertEqual(points[1].y, 15)
        points = inputView.getPoints(inputPoints: ["(10,10)"])
        XCTAssertEqual(points[0].x, 10)
        XCTAssertEqual(points[0].y, 10)
    }
    */
}

