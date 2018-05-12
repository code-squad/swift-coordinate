//
//  Pointer.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 4. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
/// 포인트 관련 함수 모음 
struct PointerMaker {
    /// 1좌표 배열을 받아서 마이포인트로 리턴
    func makeMyPoint(userPoint : String)-> MyPoint {
        // 문자열에서 숫자만 정규화
        let numberLatters = Extracter.extractNumbersFrom(originLetters: userPoint)!
        let numbers = Extracter.changeNumbersFrom(letters: numberLatters)!
        return MyPoint(x: numbers[0], y: numbers[1])
    }
    
    /// n개 좌표 배열을 받아서 마이포인트 배열로 리턴
    func makeMyPoints(userPoints:Array<String>)->[MyPoint]{
        // 마이포인트 배열 선언
        var myPoints : Array<MyPoint> = []
        // 통과한 1좌표 배열의 값을 마이포인트 배열에 추가한다
        for point in userPoints {
            myPoints.append(makeMyPoint(userPoint:point))
        }
        // 2좌표 배열이기때문에 2개를 뽑아서 리턴한다
        return myPoints
    }
    
    /// 2좌표 배열을 받아서 마이라인으로 리턴
    func makeMyLine(userPoints:Array<String>)->MyLine{
        // 마이포인트 배열 선언
        let myPoints =  makeMyPoints(userPoints: userPoints)
        // 2좌표 배열이기때문에 2개를 뽑아서 리턴한다
        return MyLine(pointA: myPoints[0], pointB: myPoints[1])
    }
    
    ///3좌표 배열을 받아 마이 트라이앵글 로 리턴
    func makeMyTriangle(userPoints:Array<String>)->MyTriangle{
        // 마이포인트 배열 선언
        let myPoints =  makeMyPoints(userPoints: userPoints)
        // 3좌표 배열이기때문에 3개를 뽑아서 리턴한다
        return MyTriangle(pointA: myPoints[0], pointB: myPoints[1], pointC: myPoints[2])
    }
    
    ///4좌표 배열을 받아 마이 Rect 로 리턴
    func makeMyRectangle(userPoints:Array<String>)->MyRect{
        // 마이포인트 배열 선언
        let myPoints =  makeMyPoints(userPoints: userPoints)
        // 마이포인트 배열을 받아서 CGSize 로 생성
        let size = Extracter.extractCGSize(myPoints)
        // 마이포인트 배열에서 기준점 추출
        let origin = Extracter.extractOriginPoint(myPoints)
        // 리턴
        return MyRect(origin: origin, size: size)
    }
    
    /// 마이포인트로 정규화된 문자열을 받아서 포인츠로 리턴
    func makePointersFrom(points : [String])->Points?{
        switch points.count {
        case 1 :
            return makeMyPoint(userPoint:points[0])
        case 2 :
            return makeMyLine(userPoints:points)
        case 3 :
            return makeMyTriangle(userPoints:points)
        case 4 :
            return makeMyRectangle(userPoints:points)
        // 이 외외의 경우는 모두 에러
        default : return nil
        }
    }

}
