//
//  Key.swift
//  CoordinateCalculator
//
//  Created by Jung seoung Yeo on 2018. 4. 11..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

// 프로세스 key 관리
enum CoordKey {
    case Point
    case Line
    
    var keyNumber: Int {
        switch self {
        case .Point: return 1
        case .Line: return 2
        }
    }
}
