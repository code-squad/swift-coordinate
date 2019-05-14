//
//  Converter.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 14/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Converter {
    
    
    static func makePoint (pointArray: [Int]) -> MyPoint {
        return MyPoint(x: pointArray[0], y: pointArray[1])
    }
    
    static func makeLine (pointArray: [MyPoint]) -> MyLine {
        return MyLine(pointA: pointArray[0], pointB: pointArray[1])
    }
    
}
    

