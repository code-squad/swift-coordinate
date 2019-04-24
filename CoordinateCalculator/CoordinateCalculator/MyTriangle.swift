//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by jang gukjin on 24/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle {
    private(set) var lineAB = MyLine(startPoint: MyPoint(x: 0, y: 0), endPoint: MyPoint(x: 0, y: 0))
    private(set) var lineBC = MyLine(startPoint: MyPoint(x: 0, y: 0), endPoint: MyPoint(x: 0, y: 0))
    private(set) var lineAC = MyLine(startPoint: MyPoint(x: 0, y: 0), endPoint: MyPoint(x: 0, y: 0))
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine.init(startPoint: pointA, endPoint: pointB)
        self.lineBC = MyLine.init(startPoint: pointB, endPoint: pointC)
        self.lineAC = MyLine.init(startPoint: pointA, endPoint: pointC)
    }
    func areaCalculator(lineAB: MyLine, lineBC: MyLine, lineAC: MyLine) -> Double {
        let betweenABLength = lineAB.lengthCalculator(startPoint: lineAB.startPoint, endPoint: lineAB.endPoint)
        let betweenBCLength = lineBC.lengthCalculator(startPoint: lineBC.startPoint, endPoint: lineBC.endPoint)
        let betweenACLength = lineAC.lengthCalculator(startPoint: lineAC.startPoint, endPoint: lineAC.endPoint)
        
        let cos = (pow(betweenBCLength,2) + pow(betweenABLength,2) - pow(betweenACLength,2))/(2*betweenBCLength*betweenABLength)
        let sin = sqrt(1-pow(cos,2))
        
        let betweenArea = 0.5 * betweenBCLength * (betweenABLength * sin)
        return round(betweenArea * 100) / 100
    }
}
