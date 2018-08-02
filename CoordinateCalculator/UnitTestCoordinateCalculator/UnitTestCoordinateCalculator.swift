//
//  UnitTestCoordinateCalculator.swift
//  UnitTestCoordinateCalculator
//
//  Created by oingbong on 2018. 8. 2..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestCoordinateCalculator: XCTestCase {
    
    func testIsAllowCharacters_Pass(){
        let input = "(10,10)"
        let isTrue = InputView.isAllowCharacters(text: input)
        XCTAssertTrue(isTrue)
    }
    
    func testIsAllowCharacters_Fail(){
        let input = "(10,10)r"
        let isFalse = InputView.isAllowCharacters(text: input)
        XCTAssertFalse(isFalse)
    }
    
    func testConvertToPoints_Pass(){
        let input = "(10,10)-(12,12)"
        let myPoint = InputView.convertToPoints(value: input)
        
        let mypoint2 = MyPoint.init(x: 10, y: 10)
        let mypoint3 = MyPoint.init(x: 12, y: 12)
        var myPoints = [MyPoint]()
        myPoints.append(mypoint2)
        myPoints.append(mypoint3)
        /*
         아래 [MyPoint] 를 XCTAssertEqual 로 비교할 때 Equatable 을 사용하지 않으면 아래와 같은 메세지가 나옵니다.
         에러메세지 : Expression type '()' is ambiguous without more context
         
         비교 및 테스트를 진행하기 위해 MyPoint 객체에 Equatable 프로토콜을 추가하였습니다.
         Int, String 등 기본 제공되는 데이터타입에는 Equatable를 추가해서 비교가 가능하지만
         Custom 구조체 혹은 클래스 등은 명시해주지 않는 이상 비교를 할 수 없습니다.
         */
        XCTAssertEqual(myPoint, myPoints)
    }
    
}
