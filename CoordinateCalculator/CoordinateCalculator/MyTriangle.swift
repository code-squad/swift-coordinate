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
    
    init(tripointA: MyPoint, tripointB: MyPoint, tripointC: MyPoint) { // trianglePointA: MyPoint
        self.lineAB = MyLine(pointA: tripointA, pointB: tripointB) // MyLine의 프로퍼티 이름: init의 파라미터이름! pointA : trianglePointA, pointB : trianglePointB
        self.lineBC = MyLine(pointA: tripointB, pointB: tripointC)
        self.lineAC = MyLine(pointA: tripointA, pointB: tripointC)
    
    }

    func getPointA () -> MyPoint {
       let pointA = lineAB.pointA
        return pointA
    }
    
    func getPointB () -> MyPoint {
        let pointB = lineAB.pointB
        return pointB
    }

    func getPointC () -> MyPoint {
        let pointC = lineBC.pointB
        return pointC
    }
    
}


extension MyTriangle: MyShape {

    func inValidShape() -> Bool {
        if getPointA() == getPointB() || getPointB() == getPointC() || getPointA() == getPointC() {
            return true
        }
        if lineAB == lineBC || lineBC == lineAC || lineAB == lineAC{
            return true
        } else {
            return false
        }
    }
    
    func printPoints() {
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - getPointA().y, col: (getPointA().x * 2) + 3))\(ANSICode.text.dot)") //tripointA
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - getPointB().y, col: (getPointB().x * 2) + 3))\(ANSICode.text.dot)") //tripointB
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - getPointC().y, col: (getPointC().x * 2) + 3))\(ANSICode.text.dot)") //tripointC
    }

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
