//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 10. 31..
//

import Foundation

struct MyTriangle {
    private(set) var lineAB = MyLine()
    private(set) var lineBC = MyLine()
    private(set) var lineAC = MyLine()
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine(pointA: pointA, pointB: pointB)
        self.lineBC = MyLine(pointA: pointB, pointB: pointC)
        self.lineAC = MyLine(pointA: pointA, pointB: pointC)
    }
}

extension MyTriangle: FigureCalculatable {
    init(from points: [MyPoint]) {
        self = MyTriangle(pointA: points[0], pointB: points[1], pointC: points[2])
    }
    
    // 생성된 구조체의 모든 점 반환.
    func getPoints() -> [MyPoint] {
        var owningPoints: [MyPoint] = []
        owningPoints.append(self.lineAB.pointA)
        owningPoints.append(self.lineAB.pointB)
        owningPoints.append(self.lineBC.pointA)
        owningPoints.append(self.lineBC.pointB)
        owningPoints.append(self.lineAC.pointA)
        owningPoints.append(self.lineAC.pointB)
        return owningPoints
    }
    
    // 삼각형 넓이 계산.
    func calculate() -> Double {
        let lengthOfLineAB = self.lineAB.calculate()
        let lengthOfLineBC = self.lineBC.calculate()
        let lengthOfLineAC = self.lineAC.calculate()
        var cosB = (Int(lengthOfLineAB)^2 + Int(lengthOfLineBC)^2 - Int(lengthOfLineAC)^2)
        cosB /= 2*Int(lengthOfLineAB)*Int(lengthOfLineBC)
        let sinB = sqrt(Double(1-cosB^2))
        return 1/2 * lengthOfLineAB * lengthOfLineBC * sinB
    }
    
}

extension MyTriangle {
    
    // 삼각형에서 같은 세 점이 있는 경우
    static func containsSameCoords(_ points: [MyPoint]) -> Bool {
        guard points[0] == points[1] || points[1] == points[2] || points[2] == points[0] else{ return false }
        return true
    }
    
}
