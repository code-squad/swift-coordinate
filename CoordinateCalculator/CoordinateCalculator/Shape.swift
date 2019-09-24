//
//  ShapeDrawable.swift
//  CoordinateCalculator
//
//  Created by sungchan.you on 2019/09/22.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Shape {
    var vertices: [CoordinatePresentable] { get }
    func extent() -> Double
    func distance() -> Double
}

extension Shape {
    func extent() -> Double {
        return 0
    }

    func distance() -> Double {
        return 0
    }
}
