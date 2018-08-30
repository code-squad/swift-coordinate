//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by KIMMINSIK on 2018. 8. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: MyPointConvertible{
    var coordinateList: (Int, Int)
    
    init(x: Int, y: Int) {
        coordinateList.0 = x * 2 + 3
        coordinateList.1 = abs(y - 24)
    }
}
