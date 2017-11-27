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
