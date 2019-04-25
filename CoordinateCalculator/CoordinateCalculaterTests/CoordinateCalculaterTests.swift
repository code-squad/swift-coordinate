//
//  CoordinateCalculaterTests.swift
//  CoordinateCalculaterTests
//
//  Created by 이동영 on 24/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class CoordinateCalculaterTests: XCTestCase {

    func testCheckFormat(){
        let anwser = "(10,10)"
        XCTAssertTrue(anwser.isCorrectFormat(),"()형식인지 테스트합니다")
    }
    func testCheckWrongFormat(){
        let anwser = "(10,10]"
        XCTAssertFalse(anwser.isCorrectFormat(),"()형식인지 테스트합니다")
    }
    func testGetValueFromAnwser(){
        let anwser = "(10,10)"
        let pointTuple = (10,10)
        XCTAssertEqual(pointTuple.0,try anwser.getPointTuple().0,"x 좌표 추출 테스트합니다")
        XCTAssertEqual(pointTuple.1,try anwser.getPointTuple().1,"y 좌표 추출 테스트합니다")
    }
    func testCheckRange(){
        let pointTupleOver = (25,10)
        let pointTupleUnder = (-1,-1)
        XCTAssertThrowsError( MyPoint.init(pointTupleOver) ,"범위를 초과한 입력입니다.")
        XCTAssertThrowsError( MyPoint.init(pointTupleUnder) ,"범위에 미달된 입력입니다.")
    }

}
