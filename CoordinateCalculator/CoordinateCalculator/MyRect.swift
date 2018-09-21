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
        self.rightBottom = MyPoint(x: origin.x + Int(size.width), y: origin.y - Int(size.height))
    }
    
    init(points: [MyPoint]) {
        let elements = MyRect.generateRectElemets(points)
        self.init(origin: elements.origin, size: elements.size)
    }
    
    private static func generateRectElemets(_ points: [MyPoint]) -> (origin: MyPoint, size: CGSize) {
        let sortedPoints = points.sorted(by: {$0.x < $1.x} )
        let origin:MyPoint = MyPoint(x: sortedPoints[1].x, y: sortedPoints[1].y)
        let width = sortedPoints[2].x-sortedPoints[0].x
        let height = sortedPoints[1].y-sortedPoints[0].y
        let size:CGSize = CGSize(width: CGFloat(width), height: CGFloat(height))
        
        return (origin, size)
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
