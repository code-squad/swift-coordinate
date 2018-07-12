//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by 이건희 on 2018. 7. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
public struct MyTriangle{
    private var lineAB = MyLine(pointA: MyPoint(), pointB: MyPoint())
    private var lineBC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    private var lineAC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        lineAB = MyLine(pointA: pointA, pointB: pointB)
        lineBC = MyLine(pointA: pointB, pointB: pointC)
        lineAC = MyLine(pointA: pointA, pointB: pointC)
    }
    private var cosB : Double{
        get{
            return (lineBC.length * lineBC.length + lineAB.length * lineAB.length - lineAC.length * lineAC.length) / (2 * lineBC.length * lineAB.length)
        }
    }
    public var measure: Double{
        get{
            return 0.5 * lineBC.length * lineAB.length * (sqrt(1 - (cosB * cosB)))
        }
    }
}
