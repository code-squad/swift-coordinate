//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 24/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint : Figure,Hashable{
    
    private(set) var x = 0
    private(set) var y = 0
    
    init(_ point:PointTuple) {
        self.x = point.x
        self.y = point.y
    }
    
    func getPoints() -> [MyPoint] {
        return [self]
    }
    
}
