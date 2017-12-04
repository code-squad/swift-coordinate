//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by Choi Jeong Hoon on 2017. 11. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

// 초기화 생성자를 통해 포인트의 좌표를 계산
struct MyPoint: MyShape{
    private (set) var x = 0
    private (set) var y = 0
    init(x: Int, y: Int) {
        self.x = x * 2 + 3
        self.y = abs(y - 24) + 1
    }
    
    func makeCoordinates() -> [MyPoint] {
        let myPoints = [MyPoint(x: self.x, y: self.y)]
        return myPoints
    }
}
