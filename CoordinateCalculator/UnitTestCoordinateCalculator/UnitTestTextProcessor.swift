//
//  UnitTestMyPoint.swift
//  UnitTestInput
//
//  Created by 윤지영 on 08/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestTextProcessor: XCTestCase {
    let coordinateString = "(10,9)"
    let coordinateX = 10
    let coordinateY = 9
    
    let noValue = ""
    let incompleteValue = "(,3"
    let defaultCoordinateValue = 0
    
    let leftIncompleteValue = "(2,)"
    let leftIncompleteCoordinateValue = 2
    let rightIncompleteValue = "(,5)"
    let rightIncompleteCoordinateValue = 5

    override func setUp() {}
    override func tearDown() {}
    
    func test_extractXandY_whenTextIsAllowedForm() {
        let coordiante = TextProcessor.extractPoint(from: coordinateString)
        XCTAssertTrue(coordiante.x==coordinateX && coordiante.y==coordinateY)
    }
    
    func test_extractXandY_whenTextHasNoValue() {
        let coordiante = TextProcessor.extractPoint(from: noValue)
        XCTAssertTrue(coordiante.x==defaultCoordinateValue && coordiante.y==defaultCoordinateValue)
    }
    
    func test_extractXandY_whenTextIsIncompleteForm() {
        let coordiante = TextProcessor.extractPoint(from: incompleteValue)
        XCTAssertTrue(coordiante.x==defaultCoordinateValue && coordiante.y==defaultCoordinateValue)
    }
    
    func test_extractXandY_whenTextIsLeftIncompleteForm() {
        let coordiante = TextProcessor.extractPoint(from: leftIncompleteValue)
        XCTAssertTrue(coordiante.x==leftIncompleteCoordinateValue && coordiante.y==leftIncompleteCoordinateValue)
    }
    
    func test_extractXandY_whenTextIsRightIncompleteForm() {
        let coordiante = TextProcessor.extractPoint(from: rightIncompleteValue)
        XCTAssertTrue(coordiante.x==rightIncompleteCoordinateValue && coordiante.y==rightIncompleteCoordinateValue)
    }
}
