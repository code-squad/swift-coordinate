//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 10. 29..
//

import Foundation

struct MyLine{
    private(set) var pointA = MyPoint()
    private(set) var pointB = MyPoint()
}

extension MyLine: FigureCalculatable{
    // 파라미터로 받은 점을 이용해 구조체 생성하여 반환.
    static func makeOne(from points: [MyPoint]) throws -> FigureCalculatable{
        return MyLine(pointA: points[0], pointB: points[1])
    }
    
    // 생성된 구조체의 모든 점 반환.
    func getPoints() -> [MyPoint]{
        var owningPoints: [MyPoint] = []
        owningPoints.append(self.pointA)
        owningPoints.append(self.pointB)
        return owningPoints
    }
    
    // 두 점 사이 거리 계산.
    func calculate() -> Double{
        // 큰 값에서 작은 값을 빼지 않으면 결과가 nan으로 나옴.
        let differenceX = (max(self.pointA.x, self.pointB.x)-min(self.pointA.x, self.pointB.x))^2
        let differenceY = (max(self.pointA.y, self.pointB.y)-min(self.pointA.y, self.pointB.y))^2
        return sqrt( Double((differenceX + differenceY)) )
    }
}
