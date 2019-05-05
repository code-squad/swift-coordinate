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
    private let areaOfRect: Double
    
    let explanation: String = "사각형의 넓이는 "
    
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.rightBottom = MyPoint.init(((Int(CGFloat(origin.x) + size.width)) , Int(CGFloat(origin.y) - size.height)))
        self.areaOfRect = Double(size.width * size.height)
    }
    
    init(pointA:MyPoint,pointB:MyPoint,pointC:MyPoint,pointD:MyPoint) {
        let points:[MyPoint] = [pointA,pointB,pointC,pointD]
        
        let minValues : PointTuple = points.reduce((x:Int.max,y:Int.max)){
            (min:PointTuple ,next:MyPoint) -> PointTuple in
            let minX = min.x < next.x ? min.x : next.x
            let minY = min.y < next.y ? min.y : next.y
            return (x:minX,y:minY)
        }
        let maxValues : PointTuple = points.reduce((x:Int.min,y:Int.min)){
            (max:PointTuple ,next:MyPoint) -> PointTuple in
            let maxX = max.x > next.x ? max.x : next.x
            let maxY = max.y > next.y ? max.y : next.y
            return (x:maxX,y:maxY)
        }
        let origin = MyPoint.init((x:minValues.x,y:maxValues.y))
        let size = CGSize.init(width: maxValues.x-minValues.x,height: maxValues.y-minValues.y)
        self.init(origin: origin, size: size)
    }
    
    func getPoints() -> [MyPoint] {
        let rightTop = MyPoint.init((x:rightBottom.x,y:leftTop.y))
        let leftBottom = MyPoint.init((x:leftTop.x,y:rightBottom.y))
        return [self.leftTop,rightTop,leftBottom,self.rightBottom]
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


