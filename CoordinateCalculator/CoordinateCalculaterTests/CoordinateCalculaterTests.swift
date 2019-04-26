//
//  CoordinateCalculaterTests.swift
//  CoordinateCalculaterTests
//
//  Created by 이동영 on 24/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class CoordinateCalculaterTests: XCTestCase {

    func testCheckPointFormat(){
        let anwser = Answer.init("(10,10)")
        XCTAssertTrue(anwser.isCoordinateFormat(),"()형식인지 테스트합니다")
    }
    func testCheckWrongFormat(){
         let anwser = Answer.init("(10,10]")
        XCTAssertFalse(anwser.isCoordinateFormat(),"()형식인지 테스트합니다")
    }
    func testGetValueFromAnwser(){
        let anwser = Answer.init("(10,10)")
        let pointTuple = (10,10)
        XCTAssertEqual(pointTuple.0,try anwser.getPointTuple().x,"x 좌표 추출 테스트합니다")
        XCTAssertEqual(pointTuple.1,try anwser.getPointTuple().y,"y 좌표 추출 테스트합니다")
    }
    func testCheckRange(){
        let pointTupleOver = (25,10)
        let pointTupleUnder = (-1,-1)
        XCTAssertThrowsError( try MyPoint.init(pointTupleOver) ,"범위를 초과한 입력입니다.")
        XCTAssertThrowsError( try MyPoint.init(pointTupleUnder) ,"범위에 미달된 입력입니다.")
    }
    func testCheckLineFormat(){
        let testAnwser = Answer.init("(10,10]-(20,20]")
        XCTAssertThrowsError(try testAnwser.getFormat(),"()-() 형식이 아니면 에러를 던집니다")
        let testAnwser2 = Answer.init("(10,10)-(20,20]")
        XCTAssertThrowsError(try testAnwser2.getFormat(),"()-() 형식이 아니면 에러를 던집니다")
    }

}
