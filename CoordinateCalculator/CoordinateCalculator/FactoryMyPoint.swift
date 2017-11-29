//
//  FactoryMyPoint.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 21..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct FactoryMyPoint {
    
    func makeMyPoint (_ pointValues: [(Int, Int)]) -> [MyPoint] {
        var myPoints : [MyPoint] = []
        
        for pointValue in pointValues {
            let myPoint = MyPoint(x: pointValue.0, y: pointValue.1)
            myPoints.append(myPoint)
        }
        return myPoints
    }
}
    
    /*
    func makeMyPoint (_ pointValues: [(Int, Int)]) -> [MyPoint] {
        var myPoints : [MyPoint] = [MyPoint(x: pointValues[0].0, y: pointValues[0].1)]
        var myPointsSet : Set<MyPoint> = Set<MyPoint>()
        
        while pointValues.count > 1 {
        for pointValue in pointValues {
            //var tempPoints : [MyPoint] = []
            let myPoint = MyPoint(x: pointValue.0, y: pointValue.1)
            myPoints.append(myPoint)
            
            
        }
        }
        return myPoints
    }
    */
//    private func checkSamePoints(_ point: MyPoint) {
//        for i in 1..<pointValues.count {
//        let point = points[points.count-1] // 마지막 myPoint
//        let anotherPoint = points[i]
//            point == anotherPoint
//        }
//
//    }
//

