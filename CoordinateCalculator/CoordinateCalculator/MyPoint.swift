//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by jang gukjin on 18/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
///Users/janggukjin/swift-coordinate/CoordinateCalculator

import Foundation

struct MyPoint : Figure {    
    private(set) var x = 0
    private(set) var y = 0
    private(set) var crossX = 0.0
    private(set) var crossY = 0.0
    
    init(x: Int, y:Int){
        self.x = x
        self.y = y
    }
    init(crossX: Double, crossY: Double){
        self.crossX = crossX
        self.crossY = crossY
    }
    
    func distinctIndex() -> (locationIndex: Int, myPoints: [MyPoint], guideMent: String) {
        return ([self].count,[self],"")
    }
}
