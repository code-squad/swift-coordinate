//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 28..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation
struct MyTriangle {
    
    var lineAB = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    var lineBC = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    var lineAC = MyLine(pointA: MyPoint(x: 0, y: 0), pointB: MyPoint(x: 0, y: 0))
    
    var pointA : MyPoint {
        get {
            return lineAB.pointA
        }
    }
    
    var pointB : MyPoint {
        get {
            return lineAB.pointB
        }
    }
    
    var pointC : MyPoint {
        get {
            return lineBC.pointB
        }
    }
    
    init(tripointA: MyPoint, tripointB: MyPoint, tripointC: MyPoint) { // trianglePointA: MyPoint
        self.lineAB = MyLine(pointA: tripointA, pointB: tripointB) // MyLine의 프로퍼티 이름: init의 파라미터이름! pointA : trianglePointA, pointB : trianglePointB
        self.lineBC = MyLine(pointA: tripointB, pointB: tripointC)
        self.lineAC = MyLine(pointA: tripointA, pointB: tripointC)
    }

}

extension MyTriangle: MyShape {
    func getMyPoints() -> [(Int,Int)]  {
        let myPoints = [(x: pointA.x, y: pointA.y),
                        (x: pointB.x, y: pointB.y),
                        (x: pointC.x, y: pointC.y)]
        return myPoints
    }

    static func isValidShape(_ myPoints:[MyPoint]) -> Bool {
        let lengthOfLines = [
            MyLine(pointA: myPoints[0], pointB: myPoints[1]),
            MyLine(pointA: myPoints[1], pointB: myPoints[2]),
            MyLine(pointA: myPoints[0], pointB: myPoints[2])]
        
        if lengthOfLines[0].calculate() > (lengthOfLines[1].calculate() + lengthOfLines[2].calculate()) {
            return false
        }
        if myPoints[0] == myPoints[1] || myPoints[1] == myPoints[2] || myPoints[0] == myPoints[2] {
            return false
        }
        return true
    }
}

extension MyTriangle: ResultByShape {
    
    func calculate() -> Double {
        let lengthAB = lineAB.calculate()
        let lengthBC = lineBC.calculate()
        let lengthAC = lineAC.calculate()
        
        let cosO = (pow(lengthAB, 2) + pow(lengthBC, 2) - pow(lengthAC, 2)) / (2 * lengthAB * lengthBC)
        let sinO = sqrt(1 - pow(cosO, 2))
        let triSquare = (lengthBC * lengthAB * sinO)/2
        
        return triSquare
    }
 
    func messageByShape() -> String {
        return "삼각형의 넓이는? -> "
    }
    
}
