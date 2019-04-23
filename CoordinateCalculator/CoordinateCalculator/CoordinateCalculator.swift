//
//  CoordinatePlane.swift
//  CoordinateCalculator
//
//  Created by 김성현 on 20/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordinateCalCulator {
    
    private(set) var shapes = [Drawable]()
    
    init() {
    }
    
    /// 좌표 평면에 도형을 추가합니다. 표시할 수 없는 범위이면 오류를 발생시킵니다.
    private mutating func add(_ shape: Drawable) throws {
        guard shape.isDrawable else {
            throw CoordinateCalculatorError.axisLimitExceeded
        }
        shapes.append(shape)
    }
    
    
    /// 점 배열에서 도형을 반환합니다.
    ///
    /// - Parameter points: 도형화할 점의 배열입니다.
    /// - Returns: 점의 개수가 지원되는 도형인 경우에 도형을 반환합니다.
    private func shaped(points: [Point]) throws -> Drawable {
        switch points.count {
        case 1:
            return points[0]
        case 2:
            return Line(start: points[0], end: points[1])
        case 3:
            return Triangle(pointA: points[0], pointB: points[1], pointC: points[2])
        default:
            throw CoordinateCalculatorError.shapeNotSupported
        }
    }
    
    mutating func addShape(points: [Point]) throws -> Drawable {
        let shape = try shaped(points: points)
        try add(shape)
        return shape
    }
    
    
}

enum CoordinateCalculatorError: Error, CustomStringConvertible {
    
    case axisLimitExceeded
    case shapeNotSupported
    
    var description: String {
        switch self {
        case .axisLimitExceeded:
            return "좌표축 제한 초과함"
        case .shapeNotSupported:
            return "지원되지 않는 도형"
        }
    }
    
}
