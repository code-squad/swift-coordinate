//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 5. 7..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
/// 삼각형
struct MyTriangle : Points {
    
    //삼각형의 세 변
    var lineAB = MyLine(pointA: MyPoint(x:0,y:0), pointB: MyPoint(x:0,y:0))
    var lineBC = MyLine(pointA: MyPoint(x:0,y:0), pointB: MyPoint(x:0,y:0))
    var lineAC = MyLine(pointA: MyPoint(x:0,y:0), pointB: MyPoint(x:0,y:0))

    // 생성자
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        //로직 구현
        self.lineAB = MyLine(pointA: pointA, pointB: pointB)
        self.lineAC = MyLine(pointA: pointA, pointB: pointC)
        self.lineBC = MyLine(pointA: pointB, pointB: pointC)
    }
    /// 삼각형의 넓이를 구하는 함수
    func calculateArea() -> Double {
        //세 변의 길이를 구한다
        let lengthA = lineAB.distanceBetweenPonints()
        let lengthB = lineAC.distanceBetweenPonints()
        let lengthC = lineBC.distanceBetweenPonints()
        
        // 공식은 헤론의 공식을 사용함
        let area = sqrt((lengthA+lengthB+lengthC)(-lengthA+lengthB+lengthC)(lengthA-lengthB+lengthC)(lengthA+lengthB-lengthC))/4
        // 결과값 리턴 
        return area
    }
    
    /// 프로토콜을 준수
    func getPoints() -> [MyPoint] {
        // 삼각형의 출력을 위해 각 꼭지점을 배열로 리턴
        return [self.lineAB.pointA,self.lineAB.pointB,self.lineAC.pointB]
    }
    /// 삼각형의 경우는 넓이를 리턴해준다
    func getMessage() -> String {
        return ("삼각형의 넓이는 \(calculateArea())")
    }
}
