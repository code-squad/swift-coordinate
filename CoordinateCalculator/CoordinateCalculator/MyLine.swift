//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by Elena on 02/11/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {

    private (set) var pointA : MyPoint
    private (set) var pointB : MyPoint
    
    init(pointA: MyPoint, pointB: MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
    /*
    MyLine 구조체는 다음과 같은 형태를 가진다.
    struct MyLine {
        var pointA = MyPoint(x: 0, y: 0)
        var pointB = MyPoint(x: 0, y: 0)
    }
     
     
     입력받은 두 개의 좌표값 정보를 처리하기 위한 MyLine 구조체를 구현한다.
     
     MyLine 구조체 인스턴스를 OutputView에 넘겨서 두 점을 출력하는 함수를 추가한다.
     MyLine 구조체에는 두 점 사이의 거리를 계산하는 함수를 구현한다.
     좌표가 그려진 아래 27번째 줄에는 두 점 사이 거리를 계산해서 출력한다.
     
     print("\(ANSICode.text.white)"WHITE)
     두 점 사이 거리는 제곱근((A.x - B.x)^제곱 + (A.y - B.y)^제곱) 공식으로 계산할 수 있다.
     제곱근을 구하는 수학 함수는 sqrt()를 활용한다.*/
    static func getDistanceTwoPoints (a pointA : MyPoint , b pointB : MyPoint) -> Double {
        let distanceTwoPointslen = sqrt(Double(pointA.x - pointB.x)) + sqrt(Double(pointA.y - pointB.y))
        return distanceTwoPointslen
    }

}
