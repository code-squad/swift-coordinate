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
    var description: String? { get }
}

extension Shape {
    var description: String? {
        return nil
    }
}
