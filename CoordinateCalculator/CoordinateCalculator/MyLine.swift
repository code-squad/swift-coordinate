//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by 이건희 on 2018. 7. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
public struct MyLine: MyShape {
    private var pointA = MyPoint(x: 0, y: 0)
    private var pointB = MyPoint(x: 0, y: 0)
    public init(pointA : MyPoint, pointB : MyPoint){
        self.pointA = pointA
        self.pointB = pointB
    }
    public var length : Double{
        get{
            let deltaX = pointB.x - pointA.x
            let deltaY = pointB.y - pointA.y
            return sqrt( Double((deltaX*deltaX) + (deltaY*deltaY)))
        }
    }
}
