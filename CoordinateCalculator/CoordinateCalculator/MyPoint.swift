//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by KIMMINSIK on 2018. 8. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: MyPointConvertible{
  
    private (set) var x: Int = 0
    private (set) var y: Int = 0
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y

    }
}
