//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by jang gukjin on 26/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect : Figure {
    private(set) var leftTop = MyPoint(x: 0, y: 0)
    private(set) var rightBottom = MyPoint(x: 0, y: 0)
    private(set) var anotherPoint = MyPoint(x: 0, y: 0)
    private(set) var crossPoint = MyPoint(crossX: 0.0, crossY: 0.0)
    private(set) var diagonalLength : Double = 0.0
    
    init(x: Int, y: Int) {
        self.leftTop = MyPoint(x: x, y: y)
        self.rightBottom = MyPoint(x: x, y: y)
    }
    
    init(leftTop: MyPoint, rightBottom: MyPoint) {
        self.leftTop = leftTop
        self.rightBottom = rightBottom
        self.crossPoint = MyPoint(crossX: Double(leftTop.x) + Double(rightBottom.x-leftTop.x)/2, crossY: Double(leftTop.y) + Double(rightBottom.y-leftTop.y)/2)
        self.diagonalLength = MyLine.lengthCalculator(MyLine.init(startPoint: leftTop, endPoint: rightBottom))()
    }
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint){
        self.leftTop = pointA
        self.rightBottom = pointB
        self.anotherPoint = pointC
        self.crossPoint = MyPoint(crossX: Double(leftTop.x) + Double(rightBottom.x-leftTop.x)/2, crossY: Double(leftTop.y) + Double(rightBottom.y-leftTop.y)/2)
    }
    
    private func areaCalculator(leftTop: MyPoint, rightBottom: MyPoint, anotherPoint: MyPoint) -> Double {
        let rowLine = MyLine.lengthCalculator(MyLine.init(startPoint: leftTop, endPoint: anotherPoint))()
        let columnLine = MyLine.lengthCalculator(MyLine.init(startPoint: anotherPoint, endPoint: rightBottom))()
        
        let betweenArea = rowLine * columnLine
        return round(betweenArea * 100)/100
    }
    
    func distinctIndex() -> (locationIndex: Int, myPoints: [MyPoint], guideMent : String) {
        var trianglePoints : [MyPoint] = []
        trianglePoints.append(leftTop)
        trianglePoints.append(rightBottom)
        trianglePoints.append(anotherPoint)
        trianglePoints.append(MyPoint.init(x: anotherPoint.x + Int((crossPoint.crossX - Double(anotherPoint.x)) * 2), y: anotherPoint.y + Int((crossPoint.crossY - Double(anotherPoint.y)) * 2)))
        let guideMent = "네점을 잇는 사각형의 넓이는 \(areaCalculator(leftTop: leftTop, rightBottom: rightBottom, anotherPoint: anotherPoint)) 입니다."
        return (trianglePoints.count, trianglePoints, guideMent)
    }
}
