//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by jang gukjin on 26/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect : Figure {
    private(set) var lineAB = MyLine(startPoint: MyPoint(x: 0, y: 0), endPoint: MyPoint(x: 0, y: 0))
    private(set) var lineBC = MyLine(startPoint: MyPoint(x: 0, y: 0), endPoint: MyPoint(x: 0, y: 0))
    private(set) var lineCD = MyLine(startPoint: MyPoint(x: 0, y: 0), endPoint: MyPoint(x: 0, y: 0))
    private(set) var lineAD = MyLine(startPoint: MyPoint(x: 0, y: 0), endPoint: MyPoint(x: 0, y: 0))
    
    init(x: Int, y: Int) {
        self.lineAB = MyLine(x: x, y: y)
        self.lineBC = MyLine(x: x, y: y)
        self.lineCD = MyLine(x: x, y: y)
        self.lineAD = MyLine(x: x, y: y)
    }
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint, pointD: MyPoint) {
        self.lineAB = MyLine.init(startPoint: pointA, endPoint: pointB)
        self.lineBC = MyLine.init(startPoint: pointB, endPoint: pointC)
        self.lineCD = MyLine.init(startPoint: pointC, endPoint: pointD)
        self.lineAD = MyLine.init(startPoint: pointA, endPoint: pointD)
    }
    
    private func areaCalculator(lineAB: MyLine, lineBC: MyLine) -> Double {
        let betweenABLength = lineAB.lengthCalculator()
        let betweenBCLength = lineBC.lengthCalculator()
        
        let betweenArea = betweenABLength * betweenBCLength
        return round(betweenArea * 100) / 100
    }
    
    func distinctIndex() -> (locationIndex: Int, myPoints: [MyPoint], guideMent : String) {
        var trianglePoints : [MyPoint] = []
        trianglePoints.append(lineAB.startPoint)
        trianglePoints.append(lineAB.endPoint)
        trianglePoints.append(lineCD.startPoint)
        trianglePoints.append(lineCD.endPoint)
        let guideMent = "네점을 잇는 사각형의 넓이는 \(areaCalculator(lineAB: lineAB, lineBC: lineBC)) 입니다."
        return (trianglePoints.count, trianglePoints, guideMent)
    }
}
