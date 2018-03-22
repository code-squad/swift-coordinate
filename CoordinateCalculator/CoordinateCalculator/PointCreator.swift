//
//  PointCreator.swift
//  CoordinateCalculator
//
//  Created by rhino Q on 2018. 3. 21..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

enum PointCreatorError:Error{
    case notSupport
}

extension PointCreatorError:LocalizedError{
    public var errorDescription:String? {
        switch self {
        case .notSupport:
            return "지원하지 않습니다."
        }
    }
}

struct PointCreator {
    func creatPoint(_ points:Points) throws -> Point {

        switch points.count {
        case 1:
            return MyPoint(x: points[0].x, y: points[0].y)
        case 2:
            return createMyLine(points)
        default:
            throw PointCreatorError.notSupport
        }
    }
    
    private func createMyLine(_ points:Points) -> MyLine{
        let pointA = MyPoint(x: points[0].x, y: points[0].y)
        let pointB = MyPoint(x: points[1].x, y: points[1].y)
        return MyLine(pointA: pointA, pointB: pointB)
    }
}
