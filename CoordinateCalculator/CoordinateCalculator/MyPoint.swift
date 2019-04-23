//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 이진영 on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum CoordinateRangeError: Error {
    case invalidRange
}

struct MyPoint {
    private(set) var x = 0
    private(set) var y = 0
    
    init(x: Int, y: Int) throws {
        guard 0...24 ~= x, 0...24 ~= y else { throw CoordinateRangeError.invalidRange }
        
        self.x = x
        self.y = y
    }
}
