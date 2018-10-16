//
//  UnitTestShape.swift
//  UnitTestInput
//
//  Created by 윤지영 on 15/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestShapeGenerator: XCTestCase {
    let noPoint = [MyPoint]()
    let onePoint = [MyPoint(x:1, y:1)]
    let twoPoints = [MyPoint(x:1, y:1), MyPoint(x:10, y:10)]
    
    let validThreePoints = [MyPoint(x:5, y:1), MyPoint(x:2, y:2), MyPoint(x:20, y:20)]
    let invalidThreePoints = [MyPoint(x:1, y:1), MyPoint(x:10, y:10), MyPoint(x:20, y:20)]
    
    let vaildFourPoints = [MyPoint(x:10,y:10),MyPoint(x:22,y:10),MyPoint(x:22,y:18),MyPoint(x:10,y:18)]
    let invalidFourPoints = [MyPoint(x:10,y:10),MyPoint(x:22,y:10),MyPoint(x:22,y:18),MyPoint(x:10,y:17)]
    let fourPointNotSupported = [MyPoint(x:2,y:0),MyPoint(x:4,y:2),MyPoint(x:2,y:2),MyPoint(x:0,y:2)]
    

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
    
    func testShapeGeneratorNotNil_whenValidThreePoints() {
        XCTAssertNotNil(ShapeGenerator.generateShape(by: validThreePoints))
    }
    
    func testShapeGeneratorNil_whenInvalidThreePoints() {
        XCTAssertNil(ShapeGenerator.generateShape(by: invalidThreePoints))
    }
    
    func testShapeGeneratorNotNil_whenValidFourPoints() {
        XCTAssertNotNil(ShapeGenerator.generateShape(by: vaildFourPoints))
    }
    
    func testShapeGeneratorNil_whenInalidFourPoints() {
        XCTAssertNil(ShapeGenerator.generateShape(by: invalidFourPoints))
    }
    
    func testShapeGeneratorNil_whenFourPointsNotSupported() {
        XCTAssertNil(ShapeGenerator.generateShape(by: fourPointNotSupported))
    }
}
