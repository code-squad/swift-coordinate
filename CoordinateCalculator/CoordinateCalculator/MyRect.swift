//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by jack on 2017. 12. 15..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect : MyShape, canCalculate {
    
    var leftTop : MyPoint = MyPoint.init(x: 0, y: 0)
    var rightBottom : MyPoint = MyPoint.init(x: 0, y: 0)
    
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.rightBottom = MyPoint.init(x: origin.x + Int(size.width), y: origin.y + Int(size.height))
    }
    
    init?(points : [MyPoint]) {
        let sortedPoints : [MyPoint] = points.sorted(by: {$0.x < $1.x})
        
        self.leftTop = sortedPoints[0]
        self.rightBottom = sortedPoints[3]
        
        guard self.checkRectCondition(fourPoints: points) == true else {
            return nil
        }
    }
    
    func generateCoordinate() -> [MyPoint] {
        let leftBottom : MyPoint = MyPoint.init(x: self.leftTop.x, y: self.rightBottom.y)
        let rightTop : MyPoint = MyPoint.init(x: self.rightBottom.x, y: self.leftTop.y)
        let fourPoints = [self.leftTop, self.rightBottom, leftBottom, rightTop]
        
        return fourPoints
    }
    
    func calculateShape() -> Double {
        return Double((self.rightBottom.y - self.leftTop.y) * (self.rightBottom.x - self.leftTop.x)).magnitude
    }
    
    func messageOfShape() -> String {
        return "사각형의 넓이는 "
    }
    
    func checkRectCondition(fourPoints : [MyPoint]) -> Bool {
        let sortedPoints : [MyPoint] = fourPoints.sorted(by: {$0.x < $1.x})
        if checkOneRectPoint(onePoint: sortedPoints[1]) == false || checkOneRectPoint(onePoint: sortedPoints[2]) == false {
            return false
        }
        return true
    }
    
    private func checkOneRectPoint(onePoint : MyPoint) -> Bool {
        let isHorizontal : Bool = (self.leftTop.x <= onePoint.x) && (onePoint.x <= self.rightBottom.x)
        let isVertical : Bool = (self.leftTop.y <= onePoint.y) && (onePoint.y <= self.rightBottom.y)
        return isHorizontal && isVertical
    }
}
