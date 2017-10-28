//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 10. 26..
//

import Foundation

struct MyPoint{
    var x: Int = 0      // x좌표 (col)
    var y: Int = 0      // y좌표 (raw)
    
    // MyPoint 구조체 관련 에러 및 에러메시지 종류.
    enum PointError: String, Error{
        case isNil = "입력값이 없습니다."                           // nil 에러.
        case outOfBounds = "좌표가 24를 넘지 않도록 입력해주세요."      // 좌표계 최대범위 초과 에러.
    }
}
