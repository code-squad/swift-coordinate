//
//  MyTriangle .swift
//  CoordinateCalculator
//
//  Created by 이동영 on 30/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle : Figure,Calculable{
    private(set) var explanation: String = "삼각형의 넓이는 "
    
    private let lineAB :MyLine
    private let lineBC :MyLine
    private let lineAC :MyLine
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine.init(pointA, pointB)
        self.lineBC = MyLine.init(pointB, pointC)
        self.lineAC = MyLine.init(pointA, pointC)
    }
    
    private var areaOfTriangle: Double {
        let a = lineBC.getCalculatedValue()
        let b = lineAC.getCalculatedValue()
        let c = lineAB.getCalculatedValue()
        let a2 = pow(a, 2)
        let b2 = pow(b, 2)
        let c2 = pow(c, 2)
        let cosB = (a2 + c2 - b2 ) / (a*c*2)
        let sinB = sqrt(1 - pow(cosB,2))
        return a*c*sinB/2
    }
    
    func getPoints() -> [MyPoint] {
        var points = [MyPoint]()
        points.append(contentsOf: self.lineAB.getPoints())
        points.append(contentsOf: self.lineBC.getPoints())
        points.append(contentsOf: self.lineAC.getPoints())
        let deduplicationPoints =  Array(Set(points))
        return deduplicationPoints
    }
    
    func getCalculatedValue() -> Double {
        return self.areaOfTriangle
    }
}

