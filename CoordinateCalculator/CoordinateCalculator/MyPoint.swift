//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by RENO1 on 23/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    var x:Int = 0
    var y:Int = 0
}

extension MyPoint : Descriptable, Equatable {
    func toString() -> String {
        return "x:\(x) y:\(y)"
    }
    
    public static func == (lhs: MyPoint, rhs: MyPoint) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

protocol Descriptable {
    func toString() -> String
}
