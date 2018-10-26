//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 23/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine : HaveTraitShape{
    private(set) var pointA : MyPoint
    private(set) var pointB : MyPoint
    
    init(_ pointA: MyPoint, _ pointB: MyPoint){
        self.pointA = pointA
        self.pointB = pointB
    }

    // Line의 길이 계산
    func calculateDistance() -> Double{
        return sqrt(pow((pointA.xPosition-pointB.xPosition), 2) + pow((pointA.yPosition-pointB.yPosition), 2))
    }
    
    // Protocol 구현을 위한 메소드 좌표들을 리턴
    func getPoint() -> [MyPoint]{
        return [pointA, pointB]
    }
    
    // 라인의 길이를 계산
    func calculateShapeTrait() -> Double {
        return sqrt(pow((pointA.xPosition-pointB.xPosition), 2) + pow((pointA.yPosition-pointB.yPosition), 2))
    }
    
    func getMessage() -> String {
        return "두 점 사이의 거리는 "
    }
}
