//
//  coordinateCalculator.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 2018. 10. 18..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

// MyPoint 구조체의 역할 : 입력받은 좌표를 저장
struct MyPoint: Figure {
    public var x: Int
    public var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    public var points: [MyPoint] {
        return [self]
    }
}
