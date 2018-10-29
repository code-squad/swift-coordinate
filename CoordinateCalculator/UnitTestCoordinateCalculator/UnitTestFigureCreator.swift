//
//  UnitTestFigureCreator.swift
//  UnitTestCoordinateCalculator
//
//  Created by 조재흥 on 26/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestFigureCreator: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSeparateHyphen() {
        let before = FigureCreator.separateHyphen("(10,25)-(4,8)")
        XCTAssertTrue(before == ["(10,25)","(4,8)"])
    }
    
    func testReadPoint() {
        let myPoint = FigureCreator.readPoint("(10,25)")
        XCTAssertTrue(myPoint.readX() == 10 && myPoint.readY() == 25)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
