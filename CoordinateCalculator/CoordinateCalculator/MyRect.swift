//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by KIMMINSIK on 2018. 9. 17..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect: MyPointConvertible, FigurePossible, FigureCalculation {
    func convertMyPoint() -> [MyPoint] {
        let rightTop = MyPoint(x: leftTop.x, y: rightBottom.y)
        let leftBottom = MyPoint(x: rightBottom.x, y: leftTop.y)
        return [leftTop, rightTop, rightBottom, leftBottom]
    }
    
    private var leftTop: MyPoint
    private var rightBottom: MyPoint
    
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.rightBottom = MyPoint(x: origin.x + Int(size.width), y: origin.y + Int(size.height))
    }
    
    static func verifyFigure(_ pointSet: [MyPoint]) -> Bool {
        let distanceA = MyLine(pointA: pointSet[0], pointB: pointSet[2]).calculate()
        let distanceB = sqrt(pow(MyLine(pointA: pointSet[0], pointB: pointSet[1]).calculate(),2) +  pow(MyLine(pointA: pointSet[1], pointB: pointSet[2]).calculate(),2))
        if distanceA == distanceB  {
            return true
        } else { return false }
    }
    
    func calculate() -> Double {
        let height = MyLine(pointA: leftTop, pointB: MyPoint(x: leftTop.x, y: rightBottom.y)).calculate()
        let width = MyLine(pointA: MyPoint(x: leftTop.x, y: rightBottom.y), pointB: rightBottom).calculate()
        return height * width
    }
    
    var description: String = {
        return "사각형 넓이는 : "
    }()
}
