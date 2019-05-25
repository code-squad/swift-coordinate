//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 14..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: Shape, Measurable, Equatable {
    private let pointA: MyPoint
    private let pointB: MyPoint
    private(set) var points: [MyPoint]
    private(set) var area: Double
    
    init?(pointA: MyPoint, pointB: MyPoint) {
        guard pointA != pointB else {
            return nil
        }
        self.pointA = pointA
        self.pointB = pointB
        self.points = [pointA, pointB]
        self.area = sqrt(pow(Double(pointA.x - pointB.x), 2) + pow(Double(pointA.y - pointB.y), 2))
    }
    
    func areaDescription() -> String {
        return "점과 점사이의 거리는 \(area) 입니다."
    }
    
    public static func ==(lhs: MyLine, rhs: MyLine) -> Bool {
        return (lhs.pointA == rhs.pointA && lhs.pointB == rhs.pointB) || (lhs.pointA == rhs.pointB && lhs.pointB == rhs.pointA)
    }
}
