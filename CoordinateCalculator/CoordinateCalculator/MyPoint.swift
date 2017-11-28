//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 17..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    var x = 0
    var y = 0
}

extension MyPoint: MyShape, Equatable {
    
    func calculate() -> Double {
        return 0
    }
    
    static func == (lhs: MyPoint, rhs: MyPoint) -> Bool {
        return (lhs.x == rhs.x && lhs.y == rhs.y)
    }
}


/*
 struct MyData1: Equatable {
 var value1: Int = 0
 var value2: Int = 0
 }
 
 func == (lhs: MyData1, rhs: MyData1) -> Bool {
 return (lhs.value1 == rhs.value1 && lhs.value2 == rhs.value2)
 }
 
 let v11 = MyData1(value1: 10, value2: 20)
 let v12 = MyData1(value1: 20, value2: 40)
 let v13 = MyData1(value1: 10, value2: 20)
 
 v11 == v12    // false
 v11 == v13    // true

 */
