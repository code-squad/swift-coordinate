//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 17..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    var x = 0
    var y = 0
}

extension MyPoint: MyShape, Equatable {
    
    static func invalidShape(_ myPoints: [MyPoint]) -> Bool {
        for point in myPoints {
            if point.x >= 24 || point.y >= 24 {
                return true
            }
            if point.x <= 0 || point.y <= 0 {
                return true
            }
        }
        return false
    }
    
    func getMyPoints() -> [(Int,Int)] {
        let myPoints = [(x: self.x, y: self.y)]
        return myPoints
    }
    
    
    static func == (pointA: MyPoint, pointB: MyPoint) -> Bool {
        return (pointA.x == pointB.x && pointA.y == pointB.y)
    }
}

