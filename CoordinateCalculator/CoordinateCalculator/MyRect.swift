//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by 이건희 on 2018. 7. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
public struct MyRect : MyDraw{
    var leftTop = MyPoint()
    var rightBottom = MyPoint()
    var size = CGSize()
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
        size = CGSize(width: rightBottom.x - leftTop.x, height: leftTop.y - rightBottom.y)
    }
    init(origin: MyPoint, size: CGSize) {
        leftTop = origin
        rightBottom = MyPoint(x: leftTop.x + Int(size.width), y: leftTop.y - Int(size.height))
        self.size = size
    }
    var measure : Int{
        get{
            return Int(size.width) * Int(size.height)
        }
    }
    public func draw() -> String {
        var result = rect.draw(origin: (x: leftTop.x * 2 + 3, y: axis.AxisLimit - leftTop.y + 1), size: (width: Int(size.width)*2, height: Int(size.height)), isFill: true)
        result += "\(ANSICode.cursor.move(row:axis.AxisLimit + 3, col: 0))사각형의 면적은 \(measure)"
        return result
    }
}
