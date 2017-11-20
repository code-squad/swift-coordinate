//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by Choi Jeong Hoon on 2017. 11. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

// MYPoing객체에 get으로 입력된 좌표값이 연산되어 읽기전용 속성을 갖게함
struct MyPoint {
    private (set) var x = 0
    private (set) var y = 0

    var coordinates: MyPoint {
        get {
            return MyPoint(x: self.x * 2 + 3, y:  abs(self.y - 24) + 1)
        }
    }
    
}

