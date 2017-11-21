//
//  MakeMyPoint.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 21..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MakeMyPoint {

    func make (_ pointValue: (x: Int,y: Int)) -> MyPoint {
        let myPoint = MyPoint(x: pointValue.x, y: pointValue.y)
        return myPoint
    }

}
