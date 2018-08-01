//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by oingbong on 2018. 7. 27..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle:ShapeProtocol,BasicProtocol {
    
    private var lineAB = MyLine(pointA: MyPoint(), pointB: MyPoint())
    private var lineBC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    private var lineAC = MyLine(pointA: MyPoint(), pointB: MyPoint())
    
    public var ab:MyLine {
        get {
            return lineAB
        }
    }
    public var bc:MyLine {
        get {
            return lineBC
        }
    }
    public var ac:MyLine {
        get {
            return lineAC
        }
    }
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine.init(pointA: pointA, pointB: pointB)
        self.lineBC = MyLine.init(pointA: pointB, pointB: pointC)
        self.lineAC = MyLine.init(pointA: pointA, pointB: pointC)
    }
    
    init(points:[MyPoint]) {
        self.lineAB = MyLine.init(pointA: points[0], pointB: points[1])
        self.lineBC = MyLine.init(pointA: points[1], pointB: points[2])
        self.lineAC = MyLine.init(pointA: points[0], pointB: points[2])
    }
    
    public func calculate() -> Double {
        let ab = lineAB.calculate()
        let bc = lineBC.calculate()
        let ac = lineAC.calculate()
        let distanceOfAB = pow(ab, 2)
        let distanceOfBC = pow(bc, 2)
        let distanceOfAC = pow(ac, 2)
        
        let cosB = (distanceOfAB + distanceOfAC - distanceOfBC) / (2 * ab * ac)
        let sin = sqrt(1 - pow(cosB, 2))
        
        return ab * ac * sin * 0.5
    }
    
    public func message() -> String {
        return "삼각형의 넓이는 "
    }
    
}
