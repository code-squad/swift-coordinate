//
//  inputCheck.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 19/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

// Validity 구조체의 역할 : 좌표가 올바르게 입력되었는지 확인
struct Validity {
    private let coordinates: [String: Int]
    
    init(point: [String: Int]) {
        self.coordinates = point
    }
    
    // 조건(입력값의 범위: 0...24)을 만족하는지 확인하는 메소드
    public func isRight() -> Bool {
        if (0...24).contains(coordinates["x"] ?? -1) && (0...24).contains(coordinates["y"] ?? -1) {
            return true
        }
        return false
    }
}
