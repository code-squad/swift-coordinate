//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by oingbong on 2018. 7. 27..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle:ShapeProtocol {
    
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
    
    public func area() -> Double {
        let distanceOfAB = pow(lineAB.distance(), 2)
        let distanceOfBC = pow(lineBC.distance(), 2)
        let distanceOfAC = pow(lineAC.distance(), 2)
        
        let cosB = (distanceOfAB + distanceOfAC - distanceOfBC) / (2 * lineAB.distance() * lineAC.distance())
        let sin = sqrt(1 - pow(cosB, 2))
        
        return lineAB.distance() * lineAC.distance() * sin * 0.5
    }
    
    public func message() -> String {
        return "삼각형의 넓이는 \(area())"
    }
    
}
