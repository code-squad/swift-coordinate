//
//  Converter.swift
//  CoordinateCalculator
//
//  Created by Jung seoung Yeo on 2018. 4. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

// 변환기
struct Converter {
    static func getMyPoints(_ mypointStringFormat: String) throws -> [MyPoint] {
        var mypoints: [MyPoint] = []
        for mypoint in mypointStringFormat.splitDobulePoint() {
            let coordinates = try Spliter.splitSaveFormat(mypoint)
            mypoints.append(MyPoint(x: coordinates[0], y: coordinates[1]))
        }
        return mypoints
    }
    
    static func getFigure(_ points: [MyPoint]) throws -> BaseProtocol {
        switch points.count {
        case CoordCase.Point.rawValue: return MyPoint(points)
        case CoordCase.Line.rawValue: return MyLine(points)
        case CoordCase.Triangle.rawValue: return MyTriangle(points)
        default: throw CoordinateError.unknownCaseError
        }
    }
}

infix operator ^

// 지수 계산 : 2.0^2 = 2.0 * 2.0 = 4, 2.0^3 = 2.0 * 2.0 * 2.0 = 8.0, 1.0^0 = 1.0 * 0 = 0
func ^ (lhs: Double, rhs: Int) -> Double {
    guard rhs != 0 else {
        return 0.0
    }

    var result = lhs
    for _ in 0 ..< (rhs - 1) {
        result *= lhs
    }
    return result
}

