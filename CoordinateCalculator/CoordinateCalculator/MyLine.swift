//
//  File.swift
//  CoordinateCalculator
//
//  Created by Mrlee on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    var pointA = MyPoint(x: 0, y: 0)
    var pointB = MyPoint(x: 0, y: 0)
    //제곱근((A.x - B.x)^제곱 + (A.y - B.y)^제곱)
    func calcurateDistanceTwoPoints() {
        let differentialX = Double(pointA.x - pointB.x)
        let differentialY = Double(pointA.y - pointB.y)
        let resultDistance = sqrt(Double(pow(differentialX, 2) + pow(differentialY, 2)))
        print("두점사이의 거리는 : \(resultDistance)")
    }
}
