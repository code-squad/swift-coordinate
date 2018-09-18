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
   
    private init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.rightBottom = MyPoint(x: leftTop.x + Int(size.width), y: leftTop.y - Int(size.height))
    }
    
    init (points: [MyPoint]) {
        self.init(origin: points[0],
                  size: CGSize(width: CGFloat(points[2].x) - CGFloat(points[0].x), height: CGFloat(points[3].y) - CGFloat(points[0].y)))
        self.leftTop = points[3]
        self.rightBottom = points[1]
    }
    
    static func verifyFigure(_ pointSet: [MyPoint]) -> Bool {
        let distanceA = MyLine(pointA: pointSet[0], pointB: pointSet[1]).calculate()
        let distanceB = MyLine(pointA: pointSet[2], pointB: pointSet[3]).calculate()
        if distanceA == distanceB {
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
