//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by Choi Jeong Hoon on 2017. 11. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

// 좌표 속성값을 갖으면서 입력에 따라 찍히는 위치를 get으로 추가
struct MyPoint {
    private (set) var x = 0
    private (set) var y = 0
    
    var coordinates: MyPoint {
        return MyPoint(x: self.x * 2 + 3, y:  abs(self.y - 24) + 1)
    }
    
}

