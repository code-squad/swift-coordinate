//
//  CoordinateCalculaterTests.swift
//  CoordinateCalculaterTests
//
//  Created by 이동영 on 24/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class CoordinateCalculaterTests: XCTestCase {

    /*
     메소드가 너무 많은 일을 하지 않도록 분리하기 위해 노력해 본다.
     각 객체의 역할과 책임을 구분하도록 노력해 본다.
     입력을 처리하는 InputView 구조체를 추가하고, 아래 실행 결과처럼 좌표값 입력하는 메뉴를 구현한다.
     main에서 InputView 구조체 readInput() 함수를 호출한다.
     입력받은 좌표값 X, Y 정보를 처리하기 위한 MyPoint 구조체를 구현한다.
     MyPoint 구조체는 다음과 같은 형태를 가진다.
     
     좌표를 입력하세요.
     (10,10)
     
     struct MyPoint {
     var x = 0
     var y = 0
     }
     MyPoint 구조체 인스턴스를 OutputView에 넘겨서 출력하는 함수를 추가한다.
     화면 처리 유의사항
     터미널 화면은 뒤집힌 1사분면으로 동작한다. 위쪽이 0이고 아래로 내려올수록 커진다.
     X좌표축은 화면 비율상 2를 곱해서 표현해야 한다.
     X좌표축 범례는 Y축으로 25만큼 떨어진 공간에 그려진다.
     Y좌표축은 터미널 좌표상 3만큼 떨어져서 그려진다.
    */
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
        XCTAssertEqual(pointTuple.0,try anwser.getPointTuple().0,"x좌표 추출 테스트합니다")
        XCTAssertEqual(pointTuple.1,try anwser.getPointTuple().1,"y좌표 추출 테스트합니다")
    }
    

}
