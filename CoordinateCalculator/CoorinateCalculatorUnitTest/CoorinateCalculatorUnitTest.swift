//
//  CoorinateCalculatorUnitTest.swift
//  CoorinateCalculatorUnitTest
//
//  Created by Mrlee on 2017. 11. 7..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import CoordinateCalculator

class CoorinateCalculatorUnitTest: XCTestCase {
    var coordinateModelTest = CoordinateModel()
    var myPointTest = MyPoint()
    var myPointTestB = MyPoint()
    var myLineTest = MyLine()
    var calculatorTest = Calculator()
    var inputViewTest = InputView()
    
    override func setUp() {
        super.setUp()
        myPointTest.x = 10
        myPointTest.y = 10
        myPointTestB.x = 10
        myPointTestB.y = 20
        myLineTest.pointA = myPointTest
        myLineTest.pointB = myPointTestB
        coordinateModelTest.trixInfo.point = [myPointTest]
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMakeInstance() {
        XCTAssertNotNil(coordinateModelTest)
        XCTAssertNotNil(myPointTest)
        XCTAssertNotNil(myLineTest)
        XCTAssertNotNil(calculatorTest)
        XCTAssertNotNil(inputViewTest)
    }
    
    func testCalculateMethod() {
        calculatorTest.sortAndMakePoints(coordinateModelTest)
        XCTAssertEqual(coordinateModelTest.pointsKind, PointsInfo.point)
        XCTAssertEqual(coordinateModelTest.trixInfo.value, 0.0)
        XCTAssertEqual(coordinateModelTest.trixInfo.point[0].x, 10)
        XCTAssertEqual(coordinateModelTest.trixInfo.point[0].y, 10)
    }
    
    func testInputMethod() {
//        do {
//            try inputViewTest.extract(coordinateModelTest)
//        } catch InputViewError.invalidPoint {
//            print("invalidPoint")
//        } catch InputViewError.invalidCharacterSet {
//            print("invalidCharacterSet")
//        } catch {
//            print("defalut catch...")
//        }
    }
    
    func testMyLineDistance() {
     XCTAssertEqual(myLineTest.calcurateDistanceTwoPoints(), 10)
    }
    
}
