//
//  Mypoint.swift
//  CoordinateCalculator
//
//  Created by Elena on 30/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation


struct MyPoint : FigureProtocol {
    
    private (set) var x : Int
    private (set) var y : Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    var points: [MyPoint] {
        return [self]
    }
    
}
