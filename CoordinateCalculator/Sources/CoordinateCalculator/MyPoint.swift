//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 10. 26..
//

import Foundation

struct MyPoint{
    var x: Int = 0
    var y: Int = 0
    
    enum PointError: String, Error{
        case isNil = "입력값이 없습니다."
        case outOfBounds = "좌표가 24를 넘지 않도록 입력해주세요."
    }
}
