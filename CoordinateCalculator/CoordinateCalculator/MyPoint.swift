//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by KIMMINSIK on 2018. 8. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: MyPointConvertible{
  
    private (set) var coordinateX: Int = 0
    private (set) var coordinateY: Int = 0
    
    init(x: Int, y: Int) {
        coordinateX = x * 2 + 4
        coordinateY = abs(y - 24)
    }
}
