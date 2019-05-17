//
//  Message.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 17..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

enum Message: CustomStringConvertible {
    case unexpectedError(error: Error)
    case distanceBetweenPoints(distance: Double)
    
    var description: String {
        switch self {
        case .unexpectedError(let error):
            return "예상치 못한 에러가 발생하였습니다.\(error)"
        case .distanceBetweenPoints(let distance):
            return "점과 점사이의 거리는 \(distance) 입니다."
        }
    }
}
