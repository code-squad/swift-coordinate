//
//  MyTriangle .swift
//  CoordinateCalculator
//
//  Created by 이동영 on 30/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle : Figure{

    var description: String { return "삼각형의 넓이는  \(widthOfTriangle)"}
    
    var heightOfTriangle:Double{
        let lengthA = lineBC.distanceOfPoints
        let lengthB = lineAC.distanceOfPoints
        let lengthC = lineAB.distanceOfPoints
        
        let cosB = pow(lengthA, 2) + pow(lengthC, 2) - pow(lengthB, 2) / 2*lengthA*lengthC
        
        return lengthC / cosB
    }
    
    var widthOfTriangle: Double {
        let a = lineBC.distanceOfPoints
        let b = lineAC.distanceOfPoints
        let c = lineAB.distanceOfPoints
        let a2 = pow(a, 2)
        let b2 = pow(b, 2)
        let c2 = pow(c, 2)
        let cosB = (a2 + c2 - b2 ) / (a*c*2)
        let sinB = sqrt(1 - pow(cosB,2))
        return a*c*sinB/2
    }
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        lineAB = MyLine.init(pointA, pointB)
        lineBC = MyLine.init(pointB, pointC)
        lineAC = MyLine.init(pointA, pointC)
    }
    
    private(set) var lineAB :MyLine
    private(set) var lineBC :MyLine
    private(set) var lineAC :MyLine
    
    func getPoints() -> [MyPoint] {
        var points = [MyPoint]()
        points.append(contentsOf: lineAB.getPoints())
        points.append(contentsOf: lineBC.getPoints())
        points.append(contentsOf: lineAC.getPoints())
        return points
    }
    
}

