//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by 이건희 on 2018. 7. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
public struct MyRect{
    private var leftTop = MyPoint()
    private var rightBottom = MyPoint()
    public var size : CGSize {
        get {return CGSize(width: rightBottom.x - leftTop.x, height: leftTop.y - rightBottom.y)}
    }
    public func getCalculatedOrigin(xcal : (Int)->Int, ycal : (Int)->Int) -> (x:Int, y:Int){
        return (xcal(leftTop.x), ycal(leftTop.y))
    }
    private func sortPointsByX(points: [MyPoint]) -> [MyPoint]{
        var sorted = [MyPoint]()
        for point in points{
            if sorted.isEmpty {
                sorted.append(point)
                continue
            }
            for i in 0..<sorted.count {
                let sp = sorted[i]
                if sp.x > point.x {
                    sorted.insert(point, at: i)
                }else if sorted.count - 1 == i{
                    sorted.append(point)
                }
            }
        }
        return sorted
    }
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint, PointD: MyPoint) throws {
        var sortedArr = sortPointsByX(points: [pointA, pointB, pointC, PointD])
        let left2Points = (sortedArr.removeFirst(), sortedArr.removeFirst())
        let right2Points = (sortedArr.removeLast(), sortedArr.removeLast())
        
        let leftBottom, rightTop : MyPoint
        if(left2Points.0.y > left2Points.1.y){
            leftTop = left2Points.0
            leftBottom = left2Points.1
        }else{
            leftTop = left2Points.1
            leftBottom = left2Points.0
        }
        if right2Points.0.y < right2Points.1.y{
            rightBottom = right2Points.0
            rightTop = right2Points.1
        }else{
            rightBottom = right2Points.1
            rightTop = right2Points.0
        }
        if leftTop.x != leftBottom.x ||
            rightTop.x != rightBottom.x ||
            leftTop.y != rightTop.y ||
            leftBottom.y != rightBottom.y {
            throw StaticData.InputError.notRectangle
        }
    }
    init(origin: MyPoint, size: CGSize) {
        leftTop = origin
        rightBottom = MyPoint(x: leftTop.x + Int(size.width), y: leftTop.y - Int(size.height))
    }
    public var measure : Int{
        get{
            return Int(size.width) * Int(size.height)
        }
    }
}
