//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 12. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect {
    var leftTop = MyPoint()
    var rightBottom = MyPoint()

    init(origin: MyPoint, size: CGSize) {
        leftTop = MyPoint(x: origin.x, y: origin.y)
        rightBottom = MyPoint(x: origin.x + Int(size.width), y: origin.y - Int(size.height))
    }
}

extension MyRect: MyShape {
    static func isValidShape(_ myPoints: [MyPoint]) -> Bool {
        let diagonalA = MyLine(pointA: myPoints[0], pointB: myPoints[2])
        let diagonalB = MyLine(pointA: myPoints[1], pointB: myPoints[3])
 
        if diagonalA.calculate() != diagonalB.calculate() {
            return false
        }
     
        if myPoints[0] == myPoints[1] ||
           myPoints[0] == myPoints[2] ||
           myPoints[0] == myPoints[3] ||
           myPoints[1] == myPoints[2] ||
           myPoints[1] == myPoints[3] ||
           myPoints[2] == myPoints[3]
        { return false }
            
        let verticalLine = MyLine(pointA: myPoints[0], pointB: myPoints[1])
        let horizontalLine = MyLine(pointA: myPoints[1], pointB: myPoints[2])
        
        if verticalLine.calculate() == horizontalLine.calculate() {
            return false
        }
        return true
    }
    
    func getMyPoints() -> [(Int, Int)] {
        let myPoints = [(x: leftTop.x, y: leftTop.y), //leftTop
                        (x: rightBottom.x, y: leftTop.y), //rightTop
                        (x: rightBottom.x, y: rightBottom.y), //rightBottom
                        (x: leftTop.x, y: rightBottom.y)] //leftBottom
        return myPoints
    }
}


extension MyRect: ResultByShape {

    func calculate () -> Double {
        return Double((rightBottom.x - leftTop.x) * (leftTop.y - rightBottom.y))
    }

    func messageByShape() -> String {
        return "직사각형의 넓이는? -> "
    }
    
    
}
