//
//  Measurable.swift
//  CoordinateCalculator
//
//  Created by 이진영 on 26/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum MeasurableUnit: String {
    case line = "두 점 사이 거리는 "
    case triangle = "삼각형 넓이는 "
}

protocol Measurable {
    var unit: MeasurableUnit { get }
    var value: Double { get }
}
