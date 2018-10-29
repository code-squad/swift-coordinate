//
//  unitTestMyPoint.swift
//  unitTestCoordinateCalculator
//
//  Created by 김장수 on 29/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest
import Foundation

@testable import CoordinateCalculator

class unitTestMyPoint: XCTestCase {
    let myFirstPoint = MyPoint(x: 10, y: 10)
    let mySecondPoint = MyPoint(x: 14, y: 15)

    func testMyPointPassCaseXpoint() {
        // xPoint 출력의 결과는 Nil이 되서는 안된다.
        
        let xPoint = myFirstPoint.xPoint()
        XCTAssertNotNil(xPoint)
    }

    func testMyPointPassCaseYpoint() {
        // yPoint 출력의 결과는 Nil이 되서는 안된다.
        
        let yPoint = myFirstPoint.yPoint()
        XCTAssertNotNil(yPoint)
    }

    func testMyPointPassCasePoints() {
        // yPoint 출력의 결과는 Nil이 되서는 안된다.
        
        let points = myFirstPoint.points
        XCTAssertNotNil(points)
    }
    
    
    
    // 출력되는 값이 같은지 확인하는 단위테스트
    
    func testMyPointEqualPassCaseXpoint() {
        // xPoint 출력의 결과는 입력의 x 좌표와 동일
        
        let xPoint = myFirstPoint.xPoint()
        XCTAssertEqual(xPoint, 10)
    }
    
    func testMyPointEqualPassCaseYpoint() {
        // yPoint 출력의 결과는 입력의 y 좌표와 동일
        
        let yPoint = mySecondPoint.yPoint()
        XCTAssertEqual(yPoint, 15)
    }

}
