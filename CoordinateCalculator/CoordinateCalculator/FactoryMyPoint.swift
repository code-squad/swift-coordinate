//
//  FactoryMyPoint.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 21..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct FactoryMyPoint {

    func makeMyPoint (_ pointValue: (x: Int,y: Int)) -> MyPoint {
        //var myPoints : [MyPoint] = []
        let myPoint = MyPoint(x: pointValue.x, y: pointValue.y)
        //myPoints.append(myPoint)
        return myPoint
    }

}
