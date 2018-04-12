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
    
    static func getModel(_ points: [MyPoint]) throws -> BaseProtocol {
        switch points.count {
        case CoordCase.Point.rawValue: return MyPoint(points[0])
        case CoordCase.Line.rawValue: return MyLine(points)
        default: throw CoordinateError.unknownCaseError
        }
    }
}
