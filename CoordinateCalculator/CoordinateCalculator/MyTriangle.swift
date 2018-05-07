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
        //세 변의 길이를 구한다. 소숫점 2자리 까지만 출력
        let lengthA = (lineAB.distanceBetweenPonints()*100).rounded() / 100
        let lengthB = (lineAC.distanceBetweenPonints()*100).rounded() / 100
        let lengthC = (lineBC.distanceBetweenPonints()*100).rounded() / 100
        // 계산식이 너무 복잡해서 나눔
        let step1 = (lengthA+lengthB+lengthC)
        let step2 = (-lengthA+lengthB+lengthC)
        let step3 = (lengthA-lengthB+lengthC)
        let step4 = (lengthA+lengthB-lengthC)
        
        let step5 = (step1*step2*step3*step4*100).rounded() / 100
        // 공식은 헤론의 공식을 사용함
        let area = sqrt(step5)/4
        // 결과값 리턴
        return (area*100).rounded() / 100
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
