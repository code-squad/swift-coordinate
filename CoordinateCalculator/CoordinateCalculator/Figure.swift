//
//  Figure.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/19/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Figure {
    init(x: Int, y: Int)
    func draw () -> [MyPoint]
    func ment () -> [String: Double]
}
