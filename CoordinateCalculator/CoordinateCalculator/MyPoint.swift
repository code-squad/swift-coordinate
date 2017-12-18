//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by jack on 2017. 12. 8..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint : MyShape {
    
    var x = 0
    var y = 0
    
    init(x : Int, y : Int) {
        self.x = x
        self.y = y
    }
    
    init(_ points : [MyPoint]) {
        self.x = points[0].x
        self.y = points[0].y
    }
    
    func generateCoordinate() -> [MyPoint] {
        let onePoint = [MyPoint.init(x: self.x, y: self.y)]
        return onePoint //return self
    }
}
