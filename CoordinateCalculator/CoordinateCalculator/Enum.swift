//
//  Enum.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 24/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum ExplanationType: CustomStringConvertible {
    case line
    case triangle
    case rectangle
    
    var description: String {
        switch self {
        case .line:
            return "두 점 사이의 거리는"
        case .triangle:
            return "세 점 사이의 거리는"
        case .rectangle:
            return "사각형의 넓이는"
        }
    }
}
