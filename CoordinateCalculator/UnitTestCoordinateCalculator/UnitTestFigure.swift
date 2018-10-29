//
//  UnitTestFigure.swift
//  UnitTestCoordinateCalculator
//
//  Created by 조재흥 on 18. 10. 29..
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import CoordinateCalculator

class UnitTestFigure: XCTestCase {

    var pointA : MyPoint!
    var pointB : MyPoint!
    var pointC : MyPoint!
    var myLine : MyLine!
    var myTriangle : MyTriangle!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        pointA = MyPoint.init(x: 1, y: 1)
        pointB = MyPoint.init(x: 1, y: 5)
        pointC = MyPoint.init(x: 4, y: 1)
        myLine = MyLine.init(pointA, pointB)
        myTriangle = MyTriangle.init(pointA, pointB, pointC)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        pointA = nil
        pointB = nil
        pointC = nil
        myLine = nil
        myTriangle = nil
        
    }

    func testDistanceBetween() {
        XCTAssertTrue(myLine.distanceBetween() == 4)
    }
    
    func testWidth() {
        XCTAssertTrue(myTriangle.width() == 6)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
