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
    
    func testCheckEmpty_Pass(){
        let input = "(10,10)"
        let isEmpty = InputView.checkEmpty(value: input)
        XCTAssertNotNil(isEmpty)
    }
    
    func testCheckEmpty_Fail(){
        let input = ""
        let isEmpty = InputView.checkEmpty(value: input)
        XCTAssertNil(isEmpty)
    }
    
    func testIsExceedRange_Pass(){
        let point1 = MyPoint.init(x: 10, y: 10)
        let point2 = MyPoint.init(x: 15, y: 15)
        var points = [MyPoint]()
        points.append(point1)
        points.append(point2)
        let isExceed = InputView.isExceedRange(elements: points)
        XCTAssertTrue(isExceed)
    }
    
    func testIsExceedRange_Fail(){
        let point1 = MyPoint.init(x: 10, y: 10)
        let point2 = MyPoint.init(x: 30, y: 30)
        var points = [MyPoint]()
        points.append(point1)
        points.append(point2)
        let isExceed = InputView.isExceedRange(elements: points)
        XCTAssertFalse(isExceed)
    }

    func testPrintCoordinates_Pass(){
        let point1 = MyPoint.init(x: 10, y: 10)
        let point2 = MyPoint.init(x: 20, y: 20)
        var points = [MyPoint]()
        points.append(point1)
        points.append(point2)
        let result = OutputView.printCoordinates(coordinates: points)
        XCTAssertTrue(result)
    }

    func testPrintCoordinates_Fail_0개일때(){
        let points = [MyPoint]()
        let result = OutputView.printCoordinates(coordinates: points)
        XCTAssertFalse(result)
    }
    
    func testIsQuadrangle_Pass(){
        let point1 = MyPoint.init(x: 10, y: 10)
        let point2 = MyPoint.init(x: 22, y: 10)
        let point3 = MyPoint.init(x: 22, y: 18)
        let point4 = MyPoint.init(x: 10, y: 18)
        var points = [MyPoint]()
        points.append(point1)
        points.append(point2)
        points.append(point3)
        points.append(point4)
        let isQuadrangle = MyRect.isQuadrangle(elements: points)
        XCTAssertTrue(isQuadrangle)
    }
    
    func testIsQuadrangle_Fail(){
        let point1 = MyPoint.init(x: 10, y: 10)
        let point2 = MyPoint.init(x: 22, y: 10)
        let point3 = MyPoint.init(x: 22, y: 18)
        let point4 = MyPoint.init(x: 5, y: 5)
        var points = [MyPoint]()
        points.append(point1)
        points.append(point2)
        points.append(point3)
        points.append(point4)
        let isQuadrangle = MyRect.isQuadrangle(elements: points)
        XCTAssertFalse(isQuadrangle)
    }
    
    /*
    이하 테스트코드는 InputView.selectShape() 함수의 테스트를 위해 아래와 같은 작업을 하였습니다.
    1. 각 모양 객체마다 Equatable을 추가
    2. XCTAssertEqual 에서 Protocol 변경을 하게 되면 아래와 같이 에러 발생하여 각 모양 객체로 다운캐스팅 한 후에 비교하였습니다.
     에러메세지 : Cannot invoke 'XCTAssertEqual' with an argument list of type '(BasicProtocol, BasicProtocol)'

    ** BasicProtocol에 Equatable 추가후 비교할 경우 아래와 같이 에러 발생
     에러메세지 : Protocol 'BasicProtocol' can only be used as a generic constraint because it has Self or associated type requirements
    */
    
    //(10,10)-(22,10)-(22,18)-(10,18)
    func testSelectShape_4ea_Pass(){
        let point1 = MyPoint.init(x: 10, y: 10)
        let point2 = MyPoint.init(x: 22, y: 10)
        let point3 = MyPoint.init(x: 22, y: 18)
        let point4 = MyPoint.init(x: 10, y: 18)
        var points = [MyPoint]()
        points.append(point1)
        points.append(point2)
        points.append(point3)
        points.append(point4)
        let isMyRect = InputView.selectShape(coordinates: points)
        let myRect = MyRect.init(points: points)
        if let rect = isMyRect as? MyRect {
            XCTAssertEqual(rect, myRect)
        }
    }
    
    //(10,10)-(22,10)-(22,18)
    func testSelectShape_3ea_Pass(){
        let point1 = MyPoint.init(x: 10, y: 10)
        let point2 = MyPoint.init(x: 22, y: 10)
        let point3 = MyPoint.init(x: 22, y: 18)
        var points = [MyPoint]()
        points.append(point1)
        points.append(point2)
        points.append(point3)
        let isMyTriangle = InputView.selectShape(coordinates: points)
        let myTriangle = MyTriangle.init(points: points)
        if let triangle = isMyTriangle as? MyTriangle {
            XCTAssertEqual(triangle, myTriangle)
        }
    }
    
    //(10,10)-(22,10)
    func testSelectShape_2ea_Pass(){
        let point1 = MyPoint.init(x: 10, y: 10)
        let point2 = MyPoint.init(x: 22, y: 10)
        var points = [MyPoint]()
        points.append(point1)
        points.append(point2)
        let isMyLine = InputView.selectShape(coordinates: points)
        let myLine = MyLine.init(points: points)
        if let line = isMyLine as? MyLine {
            XCTAssertEqual(line, myLine)
        }
    }
    
    //(10,10)
    func testSelectShape_1ea_Pass(){
        let point1 = MyPoint.init(x: 10, y: 10)
        var points = [MyPoint]()
        points.append(point1)
        let isMyPoint = InputView.selectShape(coordinates: points)
        let myPoint = MyPoint.init(points: points)
        if let point = isMyPoint as? MyPoint {
            XCTAssertEqual(point, myPoint)
        }
    }
    
    /*
        이하 테스트코드에서는 InputView.selectShape 의 Default 값을 MyPoint 로 설정함으로써
        1. 4개 이상인 경우에는 MyPoint 객체를 여러개 생성하여 좌표를 출력하고 에러가 없이 정상작동
        2. 값이 비어 있는 경우에는 MyPoint 객체를 생성할 때 런타임 오류가 발생
     */
    
    // 5개 경우 : (10,10)-(22,10)-(22,18)-(10,18)-(5,5)
    func testSelectShape_4개이상_Pass(){
        let point1 = MyPoint.init(x: 10, y: 10)
        let point2 = MyPoint.init(x: 22, y: 10)
        let point3 = MyPoint.init(x: 22, y: 18)
        let point4 = MyPoint.init(x: 10, y: 18)
        let point5 = MyPoint.init(x: 5, y: 5)
        var points = [MyPoint]()
        points.append(point1)
        points.append(point2)
        points.append(point3)
        points.append(point4)
        points.append(point5)
        let isMyPoint = InputView.selectShape(coordinates: points)
        let myPoint = MyPoint.init(points: points)
        XCTAssertNoThrow(isMyPoint)
    }
    
    // 값이 비었을 경우
//    func testSelectShape_Nil_Fail(){
//        var points = [MyPoint]()
//        let isMyPoint = InputView.selectShape(coordinates: points)
//        let myPoint = MyPoint.init(points: points)
//        XCTAssertNoThrow(isMyPoint)
//    }
    
}
