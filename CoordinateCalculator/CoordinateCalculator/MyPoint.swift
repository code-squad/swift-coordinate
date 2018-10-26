//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 2018. 10. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint : Figure {
    private let x : Int
    private let y : Int
    
    init(x:Int, y:Int) {
        self.x = x
        self.y = y
    }
    
    var xy : (Int,Int) {
        get {
            let willShowX = self.x * 2 + 2
            let willShowY = ANSICode.axis.AxisLimit + 1 - self.y
            return (willShowX, willShowY)
        }
    }
    
    func readX() -> Int {
        return self.x
    }
    
    func readY() -> Int {
        return self.y
    }
    
    func readPoints() -> [MyPoint] {
        return [self]
    }
}
