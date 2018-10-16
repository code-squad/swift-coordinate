//
//  UnitTestShapeValidator.swift
//  UnitTestInput
//
//  Created by 윤지영 on 16/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestShapeValidator: XCTestCase {
    let validThreePoints = [MyPoint(x:5, y:1), MyPoint(x:2, y:2), MyPoint(x:20, y:20)]
    let invalidThreePoints = [MyPoint(x:1, y:1), MyPoint(x:10, y:10), MyPoint(x:20, y:20)]
    
    let vaildFourPoints = [MyPoint(x:10,y:10),MyPoint(x:22,y:10),MyPoint(x:22,y:18),MyPoint(x:10,y:18)]
    let invalidFourPoints = [MyPoint(x:10,y:10),MyPoint(x:22,y:10),MyPoint(x:22,y:18),MyPoint(x:10,y:17)]
    let fourPointNotSupported = [MyPoint(x:2,y:0),MyPoint(x:4,y:2),MyPoint(x:2,y:2),MyPoint(x:0,y:2)]

    override func setUp() {}
    override func tearDown() {}

    func testShapeValidatorTrue_whenTriangleInequalitySatisfied() {
        XCTAssertTrue(ShapeValidator.satisfyTriangleInequality(of: validThreePoints))
    }
    
    func testShapeValidatorFalse_whenTriangleInequalityNotSatisfied() {
        XCTAssertFalse(ShapeValidator.satisfyTriangleInequality(of: invalidThreePoints))
    }
    
    func testShapeValidatorTrue_whenRectangleSatisfied() {
        XCTAssertTrue(ShapeValidator.satisfyRegtangle(of: vaildFourPoints))
    }
    
    func testShapeValidatorFalse_whenRectangleNotSatisfied() {
        XCTAssertFalse(ShapeValidator.satisfyRegtangle(of: invalidFourPoints))
    }
    
    func testShapeValidatorTrue_whenRectangleSupported() {
        XCTAssertTrue(ShapeValidator.satisfyRegtangleSupported(of: vaildFourPoints))
    }
    
    func testShapeValidatorFalse_whenRectangleNotSupported() {
        XCTAssertFalse(ShapeValidator.satisfyRegtangleSupported(of: fourPointNotSupported))
    }}
