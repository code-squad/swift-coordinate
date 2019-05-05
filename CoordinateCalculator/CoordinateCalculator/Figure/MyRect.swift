//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 05/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect :Figure,Calculable{
    
    private (set) var leftTop:MyPoint
    private (set) var rightBottom:MyPoint
    private var areaOfRect: Double {
        let width = rightBottom.x - leftTop.x
        let height = leftTop.y - rightBottom.y
        return Double(width * height)
    }
    let explanation: String = "사각형의 넓이는 "
    
    init(pointA:MyPoint,pointB:MyPoint,pointC:MyPoint,pointD:MyPoint) {
        let points = [pointA,pointB,pointC,pointD]
        var rightBottom = pointA
        var leftTop = pointB
        _ = points.map{
            point in
            rightBottom = point.x >= rightBottom.x && point.y <= rightBottom.y ? point : rightBottom
            leftTop = point.x <= leftTop.x && point.y >= leftTop.y ? point : leftTop
        }
        self.rightBottom = rightBottom
        self.leftTop = leftTop
    }
    
    func getPoints() -> [MyPoint] {
        let rightTop = MyPoint.init((x:rightBottom.x,y:leftTop.y))
        let leftBottom = MyPoint.init((x:leftTop.x,y:rightBottom.y))
        return [leftTop,rightTop,leftBottom,rightBottom]
    }
    
    func getCalculatedValue() -> Double {
        return self.areaOfRect
    }
    
    static func isRectFormat(points:[MyPoint])->Bool{
        guard Array(Set(points)).count == 4 else { return false }
        let countX:Int = Set(points.map{
            point in
            point.x
        }).count
        let countY:Int = Set(points.map{
            point in
            point.y
        }).count
        
        return countX == 2 && countY == 2
    }
    
    
}
