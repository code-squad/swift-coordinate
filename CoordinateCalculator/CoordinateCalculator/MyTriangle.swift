//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by 이건희 on 2018. 7. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
public struct MyTriangle : MyDraw{
    var lineAB = MyLine(pointA: MyPoint(), pointB: MyPoint())
    var lineBC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    var lineAC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        lineAB = MyLine(pointA: pointA, pointB: pointB)
        lineBC = MyLine(pointA: pointB, pointB: pointC)
        lineAC = MyLine(pointA: pointA, pointB: pointC)
    }
    var cosB : Double{
        get{
            return (lineBC.length * lineBC.length + lineAB.length * lineAB.length - lineAC.length * lineAC.length) / (2 * lineBC.length * lineAB.length)
        }
    }
    var measure: Double{
        get{
            return 0.5 * lineBC.length * lineAB.length * (sqrt(1 - (cosB * cosB)))
        }
    }
    public func draw() -> String {
        return "\(ANSICode.cursor.move(row:axis.AxisLimit + 3, col: 0))삼각형의 면적은 \(measure)"
    }
}
