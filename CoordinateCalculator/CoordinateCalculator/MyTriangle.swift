//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by CHOMINJI on 02/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle: Drawable {
    
    private let lineAB: MyLine
    private let lineBC: MyLine
    private let lineAC: MyLine
    
    var points: [MyPoint] {
        return lineAB.points + lineBC.points + lineAC.points
    }
    
    var area: Double {
        let powA = lineBC.distance * lineBC.distance
        let powB = lineAC.distance * lineAC.distance
        let powC = lineAB.distance * lineAB.distance
        let cosB = (powA + powC - powB) / (2 * lineBC.distance * lineAB.distance)
        let sinB = sqrt(Double(1 - cosB * cosB))
        
        let result = lineBC.distance * lineAB.distance * sinB / 2
        
        return result
    }
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine(pointA: pointA, pointB: pointB)
        self.lineBC = MyLine(pointA: pointB, pointB: pointC)
        self.lineAC = MyLine(pointA: pointA, pointB: pointC)
    }
}

extension MyTriangle: Calculable {
    
    var description: String {
        return "삼각형의 넓이는"
    }
    
    func getCalcultedValue() -> Double {
        return area
    }
    
}
