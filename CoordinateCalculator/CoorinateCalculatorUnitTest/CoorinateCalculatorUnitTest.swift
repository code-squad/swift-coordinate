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
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMakeInstance() {
        XCTAssertNotNil(coordinateModelTest)
        XCTAssertNotNil(myPointTest)
        XCTAssertNotNil(myLineTest)
        XCTAssertNotNil(calculatorTest)
    }
    
    func testStoreProperty() {
        coordinateModelTest.trixInfo.point = [myPointTest]
        XCTAssertEqual(coordinateModelTest.pointsKind, PointsInfo.point)
        XCTAssertEqual(coordinateModelTest.trixInfo.value, 0.0)
        XCTAssertEqual(coordinateModelTest.trixInfo.point[0].x, 0)
        XCTAssertEqual(coordinateModelTest.trixInfo.point[0].y, 0)
    }
    
    func testCalculatePointMethod() {
        coordinateModelTest.inputCoordinateValue = "(10,10)"
        myPointTest.x = 10
        myPointTest.y = 10
        do{
            try calculatorTest.extract(coordinateModelTest)
            XCTAssertEqual(coordinateModelTest.trixInfo.point[0].x, myPointTest.x)
            XCTAssertEqual(coordinateModelTest.trixInfo.point[0].y, myPointTest.y)
        } catch InputViewError.invalidPoint {
            print("input point Error...")
        } catch InputViewError.invalidCharacterSet {
            print("input characterSet Error...")
        } catch {
            print("What kind of error..?")
        }
    }
    
    func testCalculateLineMethod() {
        coordinateModelTest.inputCoordinateValue = "(10,10)-(20,20)"
        myPointTest.x = 10
        myPointTest.y = 10
        myPointTestB.x = 20
        myPointTestB.y = 20
        do{
            try calculatorTest.extract(coordinateModelTest)
            XCTAssertEqual(coordinateModelTest.trixInfo.point[0].x, myPointTest.x)
            XCTAssertEqual(coordinateModelTest.trixInfo.point[0].y, myPointTest.y)
            XCTAssertEqual(coordinateModelTest.trixInfo.point[1].x, myPointTestB.x)
            XCTAssertEqual(coordinateModelTest.trixInfo.point[1].y, myPointTestB.y)
        } catch InputViewError.invalidPoint {
            print("input point Error...")
        } catch InputViewError.invalidCharacterSet {
            print("input characterSet Error...")
        } catch {
            print("What kind of error..?")
        }
    }
    
    func testMyLineDistance() {
        myPointTest.x = 10
        myPointTest.y = 10
        myPointTestB.x = 10
        myPointTestB.y = 20
        myLineTest.pointA = myPointTest
        myLineTest.pointB = myPointTestB
        XCTAssertEqual(myLineTest.calcurateDistanceTwoPoints(), 10)
    }
    
}
