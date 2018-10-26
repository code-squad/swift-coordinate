//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 25/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriagnle : Shape {
    private(set) var lineAB : MyLine
    private(set) var lineBC : MyLine
    private(set) var lineCA : MyLine
    
    init(_ pointA: MyPoint, _ pointB: MyPoint, _ pointC: MyPoint){
        self.lineAB = MyLine(pointA, pointB)
        self.lineBC = MyLine(pointB, pointC)
        self.lineCA = MyLine(pointC, pointA)
    }
    
    // Protocol 구현을 위한 메소드 좌표들을 리턴
    func getPoint() -> [MyPoint] {
        return [lineAB.pointA, lineAB.pointB, lineCA.pointA]
    }
    
    // Triaangle의 넓이 계산
    func calculateWidth() -> Double {
        let lengthA : Double = lineAB.calculateDistance()
        let lengthB : Double = lineBC.calculateDistance()
        let lengthC : Double = lineCA.calculateDistance()
        let sinTheta : Double = sqrt(1 - pow(((pow(lengthA, 2) + pow(lengthC, 2) - pow(lengthB, 2)) / (2 * lengthA * lengthC)), 2))
        return 0.5 * lengthA * lengthC * sinTheta
    }
    
    func calculateShapeTrait() -> Double? {
        let lengthA : Double = lineAB.calculateDistance()
        let lengthB : Double = lineBC.calculateDistance()
        let lengthC : Double = lineCA.calculateDistance()
        let sinTheta : Double = sqrt(1 - pow(((pow(lengthA, 2) + pow(lengthC, 2) - pow(lengthB, 2)) / (2 * lengthA * lengthC)), 2))
        return 0.5 * lengthA * lengthC * sinTheta
    }
}
