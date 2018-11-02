//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by Jun ho Lee on 2018. 10. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: MyFigure {
    
    var points: [MyPoint] { return [self] }
    private(set) var x: Int
    private(set) var y: Int
    var calculatedResult: Double?
    
    init(x:Int, y:Int) {
        self.x = x
        self.y = y
    }
}
