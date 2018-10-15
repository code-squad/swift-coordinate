//
//  UnitTestShape.swift
//  UnitTestInput
//
//  Created by 윤지영 on 15/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestShape: XCTestCase {
    
    let noPoint = [MyPoint]()
    let onePoint = [MyPoint(x:1, y:1)]
    let twoPoints = [MyPoint(x:1, y:1), MyPoint(x:10, y:10)]
    let validThreePoints = [MyPoint(x:5, y:1), MyPoint(x:2, y:2), MyPoint(x:20, y:20)]
    let invalidThreePoints = [MyPoint(x:1, y:1), MyPoint(x:10, y:10), MyPoint(x:20, y:20)]
    

    override func setUp() {}
    override func tearDown() {}

    func testShapeGeneratorNil_whenNoPoint() {
        XCTAssertNil(ShapeGenerator.generateShape(by: noPoint))
    }
    
    func testShapeGeneratorNotNil_whenOnePoint() {
        XCTAssertNotNil(ShapeGenerator.generateShape(by: onePoint))
    }
    
    func testShapeGeneratorNotNilt_whenTwoPoints() {
        XCTAssertNotNil(ShapeGenerator.generateShape(by: twoPoints))
    }
    
    func testShapeGeneratorNotNil_whenValidThreePoint() {
        XCTAssertNotNil(ShapeGenerator.generateShape(by: validThreePoints))
    }
    
    func testShapeGeneratorNil_whenInvalidThreePoint() {
        XCTAssertNil(ShapeGenerator.generateShape(by: invalidThreePoints))
    }
}
