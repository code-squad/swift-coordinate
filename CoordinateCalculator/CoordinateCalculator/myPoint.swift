//
//  coordinateCalculator.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 2018. 10. 18..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

// MyPoint 구조체의 역할 : 입력받은 좌표를 좌표 체계에 맞게 변경 & 저장, 전달
struct MyPoint {
    private var x: Int
    private var y: Int
    
    // 제 1사분면의 좌표 체계를 이용해서 입력받은 좌표를 변경
    init(point: [String: Int]) {
        self.x = 24 - (point["y"] ?? 0)
        self.y = 2 * (point["x"] ?? 0) + 3
    }
    
    // 저장 프로퍼티를 보호하기 위한 전달 함수
    public func delievePoint() -> [Int] {
        return [x,y]
    }
}
