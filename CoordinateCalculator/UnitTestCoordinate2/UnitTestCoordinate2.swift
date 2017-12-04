//
//  UnitTestCoordinate2.swift
//  UnitTestCoordinate2
//
//  Created by YOUTH on 2017. 11. 26..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestCoordinate2: XCTestCase {
 /*
    func testMakeMyLine() {
        let pointValues = [(3,4),(10,15)]
        let factoryMyPoint = FactoryMyPoint()
        let myPointsList = factoryMyPoint.makeMyPoint(pointValues)
        
        XCTAssertNotNil(MyLine.init(pointA: myPointsList[0], pointB: myPointsList[1]))
    }
    
    // myPoint에 들어있는 각각의 값이 맞는지 확인
    func testMyPoint() {
        let pointValues = [(3,4),(10,15)]
        let factoryMyPoint = FactoryMyPoint()
        let myPointsList = factoryMyPoint.makeMyPoint(pointValues)
        XCTAssertEqual(myPointsList[0].x, 3)
        XCTAssertEqual(myPointsList[0].y, 4)
        XCTAssertEqual(myPointsList[1].x, 10)
        XCTAssertEqual(myPointsList[1].y, 15)
    }
    
    // myShape이 잘 만들어졌는지 확인 (myShape을 통해서 myLine이 잘 만들어지는지)
    func testMyshape() {
        let pointValues = [(3,4),(10,15)]
        let factoryMyPoint = FactoryMyPoint()
        let myPointsList = factoryMyPoint.makeMyPoint(pointValues)
        let factoryShape = FactoryMyShape()
        XCTAssertEqual(myPointsList.count, 2)
        let myShape = factoryShape.makeShape(myPointsList)
        let myLine = myShape as! MyLine
        XCTAssertEqual(myLine.pointA.x, 3)
        XCTAssertEqual(myLine.pointA.y, 4)
        XCTAssertEqual(myLine.pointB.x, 10)
        XCTAssertEqual(myLine.pointB.y, 15)

    }
 
    func testCheckPointNum() throws {
        let checking = InputChecker()
        let checkedInput = try checking.InputError(["(3,4)", "(10,15)"])
        XCTAssertEqual(checkedInput[0].0, 3)
        XCTAssertEqual(checkedInput[0].1, 4)
        XCTAssertEqual(checkedInput[1].0, 10)
        XCTAssertEqual(checkedInput[1].1, 15)
    }
    
    func testCheckPointNum2() throws {
        let checking = InputChecker()
        let checkedInput = try checking.InputError(["(3,4)", "(10,15)"])
        XCTAssertEqual(checkedInput[0].0, 3)
        XCTAssertEqual(checkedInput[0].1, 4)
        XCTAssertEqual(checkedInput[1].0, 10)
        XCTAssertEqual(checkedInput[1].1, 15)
    }
*/
    
    func testEmptyPoint() throws {
        let checking = InputChecker()
        let userInput = "(2,3)-(4,5)-"
        let inputsArray = try checking.splitIntoPoints(userInput)
        XCTAssertEqual(inputsArray.count, 2)
    }
    
    func testEmptyPoint2() throws {
        let checking = InputChecker()
        let userInput = "(2,3)-(4,5)-("
        let inputsArray = try checking.splitIntoPoints(userInput)
        XCTAssertEqual(inputsArray.count, 3)
    }
    
}
