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
    func creatPoint(_ points:Points) throws -> Shape {

        switch points.count {
        case 1:
            return createMyPoint(points[0].x, points[0].y)
        case 2:
            return createMyLine(points)
        default:
            throw PointCreatorError.notSupport
        }
    }
    
    private func createMyPoint(_ x:Int, _ y:Int) -> MyPoint{
        return MyPoint(x: x, y: y)
    }
    
    private func createMyLine(_ points:Points) -> MyLine{
        let pointFirst = createMyPoint(points[0].x, points[0].y)
        let pointSecond = createMyPoint(points[1].x, points[1].y)
        return MyLine(pointFirst: pointFirst, pointSecond: pointSecond)
    }
}
