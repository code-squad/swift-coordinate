//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 10. 26..
//

import Foundation

struct MyPoint{
    private(set) var x: Int = 0      // x좌표 (col)
    private(set) var y: Int = 0      // y좌표 (raw)
}

extension MyPoint: FigureCalculatable{
    static func makeOne(from points: [MyPoint]) throws -> FigureCalculatable{
        return points[0]
    }
    
    func getPoints() -> [MyPoint] {
        var owningPoints: [MyPoint] = []
        owningPoints.append(self)
        return owningPoints
    }
    
    func calculate() -> Double {
        return 0.0
    }
}
