//
//  UnitTestShape.swift
//  UnitTestInput
//
//  Created by 윤지영 on 15/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestShape: XCTestCase {
    
    let noPoint = [Point]()
    let onePoint = [Point(x:1, y:1)]
    let twoPoints = [Point(x:1, y:1), Point(10,10)]
    let threePoints = [Point(x:1, y:1), Point(10,10), Point(20,20)]
    

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
    
    func testShapeGeneratorNil_whenThreePoint() {
        XCTAssertNil(ShapeGenerator.generateShape(by: threePoints))
    }
}
