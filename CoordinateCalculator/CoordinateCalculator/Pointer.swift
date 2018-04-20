//
//  Pointer.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 4. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Pointer {
    /// 배열을 받아서 마이포인트로 리턴
    func makeMyPoint(numbers : Array<Int>)->MyPoint {
        // 배열이 2개짜리이므로 바로 리턴
        return MyPoint(x: numbers[0], y: numbers[1])
    }
}
