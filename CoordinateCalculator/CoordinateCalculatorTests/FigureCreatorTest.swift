//
//  FigureCreatorTest.swift
//  CoordinateCalculatorTests
//
//  Created by TaeHyeonLee on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import XCTest

@testable import CoordinateCalculator

class FigureCreatorTest: XCTestCase {
    
    var figureCreator : FigureCreator!
    
    override func setUp() {
        super.setUp()
        figureCreator = FigureCreator()
    }
    
    override func tearDown() {
        super.tearDown()
        figureCreator = nil
    }
    
    /* private function
    func testCreatePoint() {
        XCTAssertEqual(figureCreator.createPoint(point: (9, 10)).points[0].x, 9)
        XCTAssertEqual(figureCreator.createPoint(point: (10, 11)).points[0].y, 11)
        XCTAssertTrue(figureCreator.createPoint(point: (10, 11)) is MyPoint)
    }
    
    func testCreateLine() {
        let tester = [(9, 10),(24,3)]
        XCTAssertEqual(figureCreator.createLine(points: tester).points[0].x, 9)
        XCTAssertEqual(figureCreator.createLine(points: tester).points[1].y, 3)
        XCTAssertTrue(figureCreator.createLine(points: tester) is MyLine)
    }
    
    func testCreateTriangle() {
        let tester = [(9, 10),(24,3),(4,5)]
        XCTAssertEqual(figureCreator.createTriangle(points: tester).points[0].x, 9)
        XCTAssertEqual(figureCreator.createTriangle(points: tester).points[1].y, 3)
        XCTAssertEqual(figureCreator.createTriangle(points: tester).points[2].y, 5)
        XCTAssertTrue(figureCreator.createTriangle(points: tester) is MyTriangle)
    }
 
    func testGetOriginForRect() {
        let tester = [(1, 10), (5,10), (1,4), (5,4)]
        XCTAssertEqual(figureCreator.getOriginForRect(points: tester).x, 1)
        XCTAssertEqual(figureCreator.getOriginForRect(points: tester).y, 10)
    }
    
    func testGetSizeForRect() {
        let tester = [(1, 10), (5,10), (1,4), (5,4)]
        let size = figureCreator.getSizeForRect(points: tester)
        XCTAssertEqual(size.width, 4)
        XCTAssertEqual(size.height, 6)
    }
    
    func testCreateRect() {
        let tester = [(1, 10), (5,10), (1,4), (5,4)]
        XCTAssertEqual(figureCreator.createRect(points: tester).points[0].x, 1)
        XCTAssertEqual(figureCreator.createRect(points: tester).points[0].y, 10)
        XCTAssertEqual(figureCreator.createRect(points: tester).points[1].x, 5)
        XCTAssertEqual(figureCreator.createRect(points: tester).points[1].y, 10)
        XCTAssertEqual(figureCreator.createRect(points: tester).points[2].x, 5)
        XCTAssertEqual(figureCreator.createRect(points: tester).points[2].y, 4)
        XCTAssertEqual(figureCreator.createRect(points: tester).points[3].x, 1)
        XCTAssertEqual(figureCreator.createRect(points: tester).points[3].y, 4)
        XCTAssertTrue(figureCreator.createRect(points: tester) is MyRect)
    }
    */
}
