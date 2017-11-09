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
    var myPointTestA = MyPoint()
    var myPointTestB = MyPoint()
    var myPointTestC = MyPoint()
    var myLineTestAB = MyLine()
    var calculatorTest = Calculator()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMakeInstance() {
        XCTAssertNotNil(coordinateModelTest)
        XCTAssertNotNil(myPointTestA)
        XCTAssertNotNil(myLineTestAB)
        XCTAssertNotNil(calculatorTest)
    }
    
    func testStoreProperty() {
        coordinateModelTest.pointsAndResult.point = [myPointTestA]
        XCTAssertEqual(coordinateModelTest.generatrix, Generatrixs.point)
        XCTAssertEqual(coordinateModelTest.pointsAndResult.value, 0.0)
        XCTAssertEqual(coordinateModelTest.pointsAndResult.point[0].x, 0)
        XCTAssertEqual(coordinateModelTest.pointsAndResult.point[0].y, 0)
    }
    
    func testCalculatePointMethod() {
        coordinateModelTest.inputCoordinateValue = "(10,10)"
        myPointTestA.x = 10
        myPointTestA.y = 10
        do{
            try calculatorTest.extract(coordinateModelTest)
            XCTAssertEqual(coordinateModelTest.pointsAndResult.point[0].x, myPointTestA.x)
            XCTAssertEqual(coordinateModelTest.pointsAndResult.point[0].y, myPointTestA.y)
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
        myPointTestA.x = 10
        myPointTestA.y = 10
        myPointTestB.x = 20
        myPointTestB.y = 20
        do{
            try calculatorTest.extract(coordinateModelTest)
            XCTAssertEqual(coordinateModelTest.pointsAndResult.point[0].x, myPointTestA.x)
            XCTAssertEqual(coordinateModelTest.pointsAndResult.point[0].y, myPointTestA.y)
            XCTAssertEqual(coordinateModelTest.pointsAndResult.point[1].x, myPointTestB.x)
            XCTAssertEqual(coordinateModelTest.pointsAndResult.point[1].y, myPointTestB.y)
        } catch InputViewError.invalidPoint {
            print("input point Error...")
        } catch InputViewError.invalidCharacterSet {
            print("input characterSet Error...")
        } catch {
            print("What kind of error..?")
        }
    }
    
    func testCalculateTriangleMethod() {
        coordinateModelTest.inputCoordinateValue = "(10,10)-(14,15)-(20,8)"
        myPointTestA.x = 10
        myPointTestA.y = 10
        myPointTestB.x = 14
        myPointTestB.y = 15
        myPointTestC.x = 20
        myPointTestC.y = 8
        do{
            try calculatorTest.extract(coordinateModelTest)
            XCTAssertEqual(coordinateModelTest.pointsAndResult.point[0].x, myPointTestA.x)
            XCTAssertEqual(coordinateModelTest.pointsAndResult.point[0].y, myPointTestA.y)
            XCTAssertEqual(coordinateModelTest.pointsAndResult.point[1].x, myPointTestB.x)
            XCTAssertEqual(coordinateModelTest.pointsAndResult.point[1].y, myPointTestB.y)
            XCTAssertEqual(coordinateModelTest.pointsAndResult.point[2].x, myPointTestC.x)
            XCTAssertEqual(coordinateModelTest.pointsAndResult.point[2].y, myPointTestC.y)
        } catch InputViewError.invalidPoint {
            print("input point Error...")
        } catch InputViewError.invalidCharacterSet {
            print("input characterSet Error...")
        } catch {
            print("What kind of error..?")
        }
    }
    
    func testMyLineDistance() {
        myPointTestA.x = 10
        myPointTestA.y = 10
        myPointTestB.x = 10
        myPointTestB.y = 20
        myLineTestAB.pointA = myPointTestA
        myLineTestAB.pointB = myPointTestB
        XCTAssertEqual(myLineTestAB.calcurateDistanceTwoPoints(), 10)
    }
    
    func testMyTriangleArea() {
        coordinateModelTest.inputCoordinateValue = "(10,10)-(14,15)-(20,8)"
        try! calculatorTest.extract(coordinateModelTest)
        XCTAssertEqual(coordinateModelTest.pointsAndResult.value, 29.0)
    }
    
}
