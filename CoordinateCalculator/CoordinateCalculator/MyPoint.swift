//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 2018. 10. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint : Figure {
    private(set) var x : Int
    private(set) var y : Int
    
    var xy : (Int,Int) {
        get {
            let willShowX = self.x * 2 + 2
            let willShowY = ANSICode.axis.AxisLimit + 1 - self.y
            return (willShowX, willShowY)
        }
    }
}
