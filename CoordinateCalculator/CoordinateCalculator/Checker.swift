//
//  Checker.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 4. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Checker {
    
    /// 좌료값 범위를 체크
    func checkAxisRange(axisList : Array<Int>)->Bool{
        // 좌표값의 범위 체크
        for axis in axisList {
            guard 0 <= axis && 24 >= axis else {
                print("범위를 벗어난 좌표값입니다")
                return false
            }
        }
        return true
    }
}