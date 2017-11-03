//
//  PointInvalidCheckerTest.swift
//  CoordinateCalculatorTests
//
//  Created by TaeHyeonLee on 2017. 11. 3..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import XCTest

@testable import CoordinateCalculator

class PointInvalidCheckerTest: XCTestCase {
    
    var pointInvalidationChecker : PointInvalidationChecker!
    
    override func setUp() {
        super.setUp()
        pointInvalidationChecker = PointInvalidationChecker()
    }
    
    override func tearDown() {
        super.tearDown()
        pointInvalidationChecker = nil
    }
    
    /* private functions
    func testCheckInputValidataion() {
        var formula = "(10,10)"
        var tmpPoint = formula.trimmingCharacters(in: pointInvalidationChecker.customCharacterSet).split(separator: ",")
        XCTAssertEqual(try pointInvalidationChecker.checkInputValidation(formula: formula), tmpPoint)
        formula = "[(10,10)]"
        tmpPoint = formula.trimmingCharacters(in: pointInvalidationChecker.customCharacterSet).split(separator: ",")
        XCTAssertThrowsError(try pointInvalidationChecker.checkInputValidation(formula: formula))
        formula = "(25,10)"
        tmpPoint = formula.trimmingCharacters(in: pointInvalidationChecker.customCharacterSet).split(separator: ",")
        XCTAssertThrowsError(try pointInvalidationChecker.checkInputValidation(formula: formula))
        
    }
    
    func testGetAvailableCharacterSet() {
        XCTAssertEqual(0, "(10,10)-".trimmingCharacters(in: pointInvalidationChecker.getAvailableCharacterSet()).count)
        XCTAssertEqual(0, "(10,10)-(14,15)".trimmingCharacters(in: pointInvalidationChecker.getAvailableCharacterSet()).count)
        XCTAssertEqual(4, "(10,10)-test".trimmingCharacters(in: pointInvalidationChecker.getAvailableCharacterSet()).count)
    }
    
    func testCheckSamePoint() {
        var points = [(1,2), (3,4), (1,2), (7,8)]
        XCTAssertThrowsError(try pointInvalidationChecker.checkSamePoint(points: points))
        points = [(1,2), (3,4), (5,6), (7,8)]
        XCTAssertNoThrow(try pointInvalidationChecker.checkSamePoint(points: points))
    }
    
    func testCheckRectX() {
        var points = [(1,2), (4,2), (1,5), (5,5)]
        XCTAssertThrowsError(try pointInvalidationChecker.countRectX(points: points))
        points = [(1,2), (4,2), (1,5), (4,5)]
        XCTAssertNoThrow(try pointInvalidationChecker.countRectX(points: points))
    }
    func testCheckRectY() {
        var points = [(1,2), (4,2), (1,5), (4,6)]
        XCTAssertThrowsError(try pointInvalidationChecker.countRectY(points: points))
        points = [(1,2), (4,2), (1,5), (4,5)]
        XCTAssertNoThrow(try pointInvalidationChecker.countRectY(points: points))
    }
 */
    
}
