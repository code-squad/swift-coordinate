//
//  FactoryMyPoint.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 21..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct FactoryMyPoint {
    
    enum PointError: String, Error {
        case wrongPoint = "좌표값은 0 ~ 24사이의 수를 입력하세요."
    }
    
    func makeMyPoint (_ pointValues: [(Int, Int)]) throws -> [MyPoint] {
        var myPoints : [MyPoint] = []
        
        for pointValue in pointValues {
            let myPoint = MyPoint(x: pointValue.0, y: pointValue.1)
            myPoints.append(myPoint)
        }
        
        if MyPoint.invalidShape(myPoints) {
            throw PointError.wrongPoint
        }
    
        return myPoints
    }
}

