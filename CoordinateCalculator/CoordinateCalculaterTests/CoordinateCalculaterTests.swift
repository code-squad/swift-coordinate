//
//  CoordinateCalculaterTests.swift
//  CoordinateCalculaterTests
//
//  Created by 이동영 on 24/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class CoordinateCalculaterTests: XCTestCase {
    var factory : FigureFactory!
    override func setUp() {
        factory = FigureFactory()
    }
    
    func testCheckPointFormat(){
        //Given
        let anwser = Answer.init("(10,10)")
        //Then
        XCTAssertTrue(anwser.isCoordinateFormat(),"()형식인지 테스트합니다")
    }
    
    func testCheckWrongFormat(){
        //Given
        let anwser = Answer.init("(10,10]")
        //Then
        XCTAssertFalse(anwser.isCoordinateFormat(),"()형식인지 테스트합니다")
    }
    
    func testGetValueFromAnwser(){
        //Given
        let anwser = Answer.init("(10,10)")
        let pointTuple = (10,10)
        //Then
        XCTAssertEqual(pointTuple.0,try anwser.getPointTuples()[0].x,"x 좌표 추출 테스트합니다")
        XCTAssertEqual(pointTuple.1,try anwser.getPointTuples()[0].y,"y 좌표 추출 테스트합니다")
    }
    
    func testCheckRange(){
        //Given
        let excess = Answer.init("(25,10)")
        let under = Answer.init("(-1,-1)")
        let coordinateProcesser = CoordinateProcesser()
        //Then
        XCTAssertThrowsError(try coordinateProcesser.convertToFigure(answer: excess),"범위를 초과한 입력입니다.")
        XCTAssertThrowsError(try coordinateProcesser.convertToFigure(answer: under),"범위를 초과한 입력입니다.")
    }
    
    func testCheckLineFormat(){
        //Given
        let testAnwser = Answer.init("(10,10]-(20,20]")
        let testAnwser2 = Answer.init("(10,10)-(20,20]")
        let testAnwser3 = Answer.init("(5,5)-(10,10)")
        //Then
        XCTAssertNotEqual(try testAnwser.getPointTuples().count,2, "라인 형태를 제대로 추출합니다")
        
        XCTAssertNotEqual(try testAnwser2.getPointTuples().count,2, "라인 형태를 제대로 추출합니다")
        
        XCTAssertEqual(try testAnwser3.getPointTuples().count,2, "라인 형태를 제대로 추출합니다")
    }
    
    func testCheckTriangleFormat(){
        //Given
        let testAnwser = Answer.init("(10,10]-(20,20]-(10,20)")
        let testAnwser2 = Answer.init("(10,10)-(20,20]-(20,20]")
        let testAnwser3 = Answer.init("(5,5)-(10,10)-(20,20)")
        //Then
        XCTAssertNotEqual(try testAnwser.getPointTuples().count,3,"()-()-() 형식이 아니면 에러를 던집니다")
        XCTAssertNotEqual(try testAnwser2.getPointTuples().count,3,"()-()-() 형식이 아니면 에러를 던집니다")
        XCTAssertEqual(try testAnwser3.getPointTuples().count,3,"()-()-() 형식이 이면 성공합니다")
    }
    
    func testCheckRectFormat(){
        //Given
        let testAnwser = Answer.init("(10,10]-(20,20]-(10,20)-(10,10)")
        let testAnwser2 = Answer.init("(10,10)-(20,20]-(20,20]-(10,10)")
        let testAnwser3 = Answer.init("(5,10)-(5,20)-(10,10)-(20,20)")
        //Then
        XCTAssertNotEqual(try testAnwser.getPointTuples().count,4,"()-()-()-() 형식이 아니면 에러를 던집니다")
        XCTAssertNotEqual(try testAnwser2.getPointTuples().count,4,"()-()-()-() 형식이 아니면 에러를 던집니다")
        XCTAssertEqual(try testAnwser3.getPointTuples().count,4,"()-()-()-() 형식이 이면 성공합니다")
    }
    
    func testRectInit(){
        //Given
        let pointsToSuccess = [(10,10),(22,10),(22,18),(10,18)]
        let pointsToFail = [(10,11),(22,10),(22,18),(10,18)]
        //Then
        XCTAssertThrowsError(try factory.createFigure(points: pointsToFail))
        XCTAssertNoThrow(try factory.createFigure(points: pointsToSuccess))
    }
    
    func testDistanceOfPoints(){
        //Given
        let testLine = MyLine.init( MyPoint((10,10)), MyPoint((14,15)))
        //Then
        XCTAssertEqual(testLine.getCalculatedValue(), 6.4031242374328485)
    }
    
    func testAreaOfTriangle()throws {
        //Given
        let points = [(10,10),(14,15),(20,8)]
        
        //When
        guard let triangle = (try factory.createFigure( points: points)) as? MyTriangle else {return}
        
        //Then
        XCTAssertEqual(triangle.getCalculatedValue(), 29)
    }
    
    func testAreaOfRect() throws {
        //Given
        let points = [(10,10),(22,10),(22,18),(10,18)]
        
        //When
        guard let rect = (try factory.createFigure(points: points)) as? MyRect else{ return  }
        
        //Then
        XCTAssertEqual(rect.getCalculatedValue(), 96)
    }
    
}
