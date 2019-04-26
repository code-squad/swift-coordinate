//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 24/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    private(set) var x = 0
    private(set) var y = 0
    let possibleRange = 0...24
    
    init(_ point:PointTuple) throws {
        guard checkRange(point) else {
           throw Exception.ErrorType.outOfRange
        }
        self.x = point.x
        self.y = point.y
    }
    private func checkRange(_ point:PointTuple)->Bool{
       return possibleRange.contains(point.0) && possibleRange.contains(point.1)
    }
    
}
