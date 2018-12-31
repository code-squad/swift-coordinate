//
//  UnitTestFigureCreate.swift
//  UnitTestCoordinateCalculator
//
//  Created by JINA on 28/12/2018.
//  Copyright © 2018 JINA KIM. All rights reserved.
//

import XCTest
@testable import coordinateCalculator

class UnitTestFigureCreate: XCTestCase {
    var pointA = MyPoint.init(x: 10, y: 10)
    var pointB = MyPoint(x: 14, y: 15)
    var pointC = MyPoint(x: 20, y: 8)
    var line: MyLine {
        get {
            return MyLine.init(pointA: pointA, pointB: pointB)
        }
    }
    var triangle: MyTriangle {
        get {
            return MyTriangle(pointA: pointA, pointB: pointB, pointC: pointC)
        }
    }

    
    func testbringNumber() {
        let userInput = "(10,10)-(20,20)"
        let ex1: [Int?] = [10,10,20,20]
        XCTAssertEqual(ex1, FigureCreate.number(of: userInput))
    }
    
    func testMyPointNotNil() {
        XCTAssertNotNil(MyPoint.self)
    }
    
    func testNotNilMyLine() {
        XCTAssertNotNil(line)
    }
    
    func testMyTriangleNotNil() {
        let userInput: [Int?] = [10,10,14,15,20,8]
        XCTAssertNotNil(FigureCreate.createFigure(userInput))
    }
    
    func testMyLineCal() {
        XCTAssertEqual(6.4031242374328485, MyLine.calculate(line)())
    }
    
    func testMyTriangleCal() {
        XCTAssertEqual(29.0, MyTriangle.calculate(triangle)())
    }
}
