//
//  LineConverter.swift
//  CoordinateCalculator
//
//  Created by junwoo on 2019/09/24.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol DistanceConvertable {
    static func convert(_ line: MyLine) -> Double?
}

struct LineConverter: DistanceConvertable {
    static func convert(_ line: MyLine) -> Double? {
        guard line.pointA != line.pointB else { return nil }
        let x = line.pointA.x - line.pointB.x
        let y = line.pointA.y - line.pointB.y
        return sqrt(Double(x^2 + y^2))
    }
}
