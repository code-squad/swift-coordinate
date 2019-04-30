//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol AxisDrawable {
    func getPoints() -> [MyPoint]
}

struct MyPoint: AxisDrawable {
    public private(set) var x: Int = 0
    public private(set) var y: Int = 0
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
   
    init(pair: Pair) {
        self.x = pair.x
        self.y = pair.y
    }
    
    func getPoints() -> [MyPoint] {
        return [self]
    }
}


