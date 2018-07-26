//
//  FigureProtocol.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 26/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct Point {
    private (set) var x: Int
    private (set) var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

protocol FigureProtocol {
    var points: [Point] { get }
    var pointsForDisplay: [Point] { get }
}

protocol Over2DFigureProtocol {
    var valudOfFigure: String { get }
}
