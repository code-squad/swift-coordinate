//
//  Figure.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/19/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum FigureType: Int {
    case point = 1
    case line = 2
    case triangle = 3
}

protocol Figure {
    init(x: Int, y: Int)
}

