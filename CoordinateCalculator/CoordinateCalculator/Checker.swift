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
    
    /// 문자열 배열을 받아서 정수형배열로 리턴
    func numbersFrom(letters:Array<String>)->Array<Int>?{
        var numbers = Array<Int>()
        for letter in letters {
            guard let number = Int(letter) else {
                return nil
            }
            numbers.append(number)
        }
        return numbers
    }
}
