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
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testStoreProperty() {
        let myPointTestA = MyPoint()
        let coordinateModelTest = CoordinateModel()
        XCTAssertNotNil(coordinateModelTest)
        
        coordinateModelTest.points = [myPointTestA]
        XCTAssertEqual(coordinateModelTest.generatrix, Generatrixs.point)
        XCTAssertEqual(coordinateModelTest.resultOfGeneratix, 0.0)
        XCTAssertEqual(coordinateModelTest[0].x, 0)
        XCTAssertEqual(coordinateModelTest[0].y, 0)
    }
    
    func testCalculatePointMethod() {
        var myPointTestA = MyPoint()
        let coordinateModelTest = CoordinateModel()
        XCTAssertNotNil(coordinateModelTest)
        let calculatorTest = Calculator()

        coordinateModelTest.inputCoordinateValue = "(10,10)"
        myPointTestA.x = 10
        myPointTestA.y = 10
        do{
            try calculatorTest.extract(coordinateModelTest)
            XCTAssertEqual(coordinateModelTest[0].x, myPointTestA.x)
            XCTAssertEqual(coordinateModelTest[0].y, myPointTestA.y)
        } catch InputViewError.invalidPoint {
            print("input point Error...")
        } catch InputViewError.invalidCharacterSet {
            print("input characterSet Error...")
        } catch {
            print("What kind of error..?")
        }
    }
    
    func testCalculateLineMethod() {
        var myPointTestA = MyPoint()
        var myPointTestB = MyPoint()
        let coordinateModelTest = CoordinateModel()
        XCTAssertNotNil(coordinateModelTest)
        let calculatorTest = Calculator()
        coordinateModelTest.inputCoordinateValue = "(10,10)-(20,20)"
        myPointTestA.x = 10
        myPointTestA.y = 10
        myPointTestB.x = 20
        myPointTestB.y = 20
        do{
            try calculatorTest.extract(coordinateModelTest)
            XCTAssertEqual(coordinateModelTest[0].x, myPointTestA.x)
            XCTAssertEqual(coordinateModelTest[0].y, myPointTestA.y)
            XCTAssertEqual(coordinateModelTest[1].x, myPointTestB.x)
            XCTAssertEqual(coordinateModelTest[1].y, myPointTestB.y)
        } catch InputViewError.invalidPoint {
            print("input point Error...")
        } catch InputViewError.invalidCharacterSet {
            print("input characterSet Error...")
        } catch {
            print("What kind of error..?")
        }
    }
    
    func testCalculateTriangleMethod() {
        var myPointTestA = MyPoint()
        var myPointTestB = MyPoint()
        var myPointTestC = MyPoint()
        let coordinateModelTest = CoordinateModel()
        XCTAssertNotNil(coordinateModelTest)
        let calculatorTest = Calculator()

        coordinateModelTest.inputCoordinateValue = "(10,10)-(14,15)-(20,8)"
        myPointTestA.x = 10
        myPointTestA.y = 10
        myPointTestB.x = 14
        myPointTestB.y = 15
        myPointTestC.x = 20
        myPointTestC.y = 8
        do{
            try calculatorTest.extract(coordinateModelTest)
            XCTAssertEqual(coordinateModelTest[0].x, myPointTestA.x)
            XCTAssertEqual(coordinateModelTest[0].y, myPointTestA.y)
            XCTAssertEqual(coordinateModelTest[1].x, myPointTestB.x)
            XCTAssertEqual(coordinateModelTest[1].y, myPointTestB.y)
            XCTAssertEqual(coordinateModelTest[2].x, myPointTestC.x)
            XCTAssertEqual(coordinateModelTest[2].y, myPointTestC.y)
        } catch InputViewError.invalidPoint {
            print("input point Error...")
        } catch InputViewError.invalidCharacterSet {
            print("input characterSet Error...")
        } catch {
            print("What kind of error..?")
        }
    }
    
    func testCalculateRectMethod() {
        var myPointTestA = MyPoint()
        var myPointTestB = MyPoint()
        var myPointTestC = MyPoint()
        var myPointTestD = MyPoint()
        let coordinateModelTest = CoordinateModel()
        XCTAssertNotNil(coordinateModelTest)
        let calculatorTest = Calculator()
        
        coordinateModelTest.inputCoordinateValue = "(10,10)-(22,10)-(22,18)-(10,18)"
        myPointTestA.x = 10
        myPointTestA.y = 10
        myPointTestB.x = 22
        myPointTestB.y = 10
        myPointTestC.x = 22
        myPointTestC.y = 18
        myPointTestD.x = 10
        myPointTestD.y = 18
        do{
            try calculatorTest.extract(coordinateModelTest)
            XCTAssertEqual(coordinateModelTest[0].x, myPointTestA.x)
            XCTAssertEqual(coordinateModelTest[0].y, myPointTestA.y)
            XCTAssertEqual(coordinateModelTest[1].x, myPointTestB.x)
            XCTAssertEqual(coordinateModelTest[1].y, myPointTestB.y)
            XCTAssertEqual(coordinateModelTest[2].x, myPointTestC.x)
            XCTAssertEqual(coordinateModelTest[2].y, myPointTestC.y)
            XCTAssertEqual(coordinateModelTest[3].x, myPointTestD.x)
            XCTAssertEqual(coordinateModelTest[3].y, myPointTestD.y)
        } catch InputViewError.invalidPoint {
            print("input point Error...")
        } catch InputViewError.invalidCharacterSet {
            print("input characterSet Error...")
        } catch InputViewError.invalidRectangle {
            print("input Rect is not a rectangle.")
        } catch {
            print("What kind of error..?")
        }
    }

    func testMyLineDistance() {
        var myPointTestA = MyPoint()
        var myPointTestB = MyPoint()
        var myLineTestAB = MyLine()

        myPointTestA.x = 10
        myPointTestA.y = 10
        myPointTestB.x = 10
        myPointTestB.y = 20
        myLineTestAB.pointA = myPointTestA
        myLineTestAB.pointB = myPointTestB
        XCTAssertEqual(myLineTestAB.calcurateDistanceTwoPoints(), 10)
    }
    
    func testMyTriangleArea() {
        let coordinateModelTest = CoordinateModel()
        XCTAssertNotNil(coordinateModelTest)
        let calculatorTest = Calculator()
        coordinateModelTest.inputCoordinateValue = "(10,10)-(14,15)-(20,8)"
        try! calculatorTest.extract(coordinateModelTest)
        XCTAssertEqual(coordinateModelTest.resultOfGeneratix, 29.0)
    }
    
    func testMyRectangleArea() {
        let coordinateModelTest = CoordinateModel()
        XCTAssertNotNil(coordinateModelTest)
        let calculatorTest = Calculator()
        coordinateModelTest.inputCoordinateValue = "(10,10)-(22,10)-(22,18)-(10,18)"
        try! calculatorTest.extract(coordinateModelTest)
        XCTAssertEqual(coordinateModelTest.resultOfGeneratix, 96.0)
    }
    
}
