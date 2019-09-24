//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by RENO1 on 23/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    private var x:Int = 0
    private var y:Int = 0
    
    init(x:Int, y:Int) {
        self.x = x
        self.y = y
    }
}

extension MyPoint : CustomStringConvertible, Equatable {
    
    func getX() -> Int {
        return self.x
    }
    
    func getY() -> Int {
        return self.y
    }
    
    var description: String {
        return "(\(x),\(y))"
    }
    
    public static func == (lhs: MyPoint, rhs: MyPoint) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}
