//
//  CoordinateCalculator.swift
//  CoordinateCalculator
//
//  Created by 김성현 on 23/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordinateCalculator {
    
    static func shaped(points: [Point]) throws -> Drawable {
        switch points.count {
        case 1:
            return points[0]
        case 2:
            return Line(start: points[0], end: points[1])
        case 3:
            return Triangle(pointA: points[0], pointB: points[1], pointC: points[2])
        default:
            throw CoordinateError.shapeNotSupported
        }
    }
    
}

enum CoordinateError: Error, CustomStringConvertible {
    
    case shapeNotSupported
    
    var description: String {
        switch self {
        case .shapeNotSupported:
            return "지원되지 않는 도형입니다."
        }
    }
    
}
