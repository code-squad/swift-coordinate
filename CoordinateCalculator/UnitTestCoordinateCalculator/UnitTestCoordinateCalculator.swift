//
//  UnitTestCoordinateCalculator.swift
//  UnitTestCoordinateCalculator
//
//  Created by yuaming on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import XCTest

@testable import CoordinateCalculator

class UnitTestCoordinateCalculator: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInputValueSeperationToMyPoint() {
        let myPoint: MyPoint = MyPoint(x: 24, y: 10)
        let inputValue = "(24, 10)"
        let splitInputValue = try! Utility.splitInputValue(in: inputValue)
        XCTAssertEqual(splitInputValue[0].x, myPoint.x)
        XCTAssertEqual(splitInputValue[0].y, myPoint.y)
    }

    func testInputValueSeperationIsDueToEmptyValueToMyPoint() {
        let inputValue = "()"
        XCTAssertThrowsError(try Utility.splitInputValue(in: inputValue))
    }
    
    func testSuccessInInputValueSeperationToMyLine() {
        let inputValue = "(1,2)-(10,20)"
        let splitInputValue = try! Utility.splitInputValue(in: inputValue)
        let myLine = MyLine(points: splitInputValue)
        XCTAssertNotNil(myLine)
    }
    
    func testSuccessInMyLineToGetFigure() {
        let inputValue = "(1,2)-(10,20)"
        let splitInputValue = try! Utility.splitInputValue(in: inputValue)
        let figure = Figure().getFigureModel(in: splitInputValue)
        XCTAssertNotNil(figure)
    }
    
    func testSuccessInDistanceBetweenLinesToCalculate() {
        let inputValue = "(1,2)-(10,20)"
        let splitInputValue = try! Utility.splitInputValue(in: inputValue)
        let figure = Figure().getFigureModel(in: splitInputValue)
        XCTAssertTrue(figure!.calculate() > 0)
    }
    
    func testSuccessInTriangleAreaToCalculate() {
        let inputValue = "(10,10)-(14,15)-(20,8)"
        let splitInputValue = try! Utility.splitInputValue(in: inputValue)
        let figure = Figure().getFigureModel(in: splitInputValue)
        XCTAssertTrue(figure!.calculate() == 29)
    }
    
    func testTriangleAreaIsZero() {
        let inputValue = "(10,10)-(11,11)-(12,12)"
        let splitInputValue = try! Utility.splitInputValue(in: inputValue)
        let figure = Figure().getFigureModel(in: splitInputValue)
        XCTAssertThrowsError(try OutputView.moveCoordinates(in: figure!.getPoints))
    }
}
