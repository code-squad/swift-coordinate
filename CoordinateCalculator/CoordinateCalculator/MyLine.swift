//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by 이건희 on 2018. 7. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
public struct MyLine : MyDraw {
    var pointA = MyPoint(x: 0, y: 0)
    var pointB = MyPoint(x: 0, y: 0)
    var length : Double{
        get{
            let deltaX = pointB.x - pointA.x
            let deltaY = pointB.y - pointA.y
            return sqrt( Double((deltaX*deltaX) + (deltaY*deltaY)))
        }
    }
    public func draw() -> String {
        return "\(ANSICode.cursor.move(row:axis.AxisLimit + 3, col: 0))두 점 사이의 거리는 \(length)"
    }
}
