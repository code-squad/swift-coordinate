//
//  coordinateCalculator.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 2018. 10. 18..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    var x = 0
    var y = 0
    
    init(point: [Int]) {
        self.x = point[0]
        self.y = point[1]
    }
}
