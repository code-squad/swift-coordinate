//
//  Figure.swift
//  CoordinateCalculator
//
//  Created by yangpc on 2017. 10. 26..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

public typealias Axis = (row: Int, col: Int)

protocol Figure {
    func position(_ points: [MyPoint]) ->  [Axis]
    func calculator() -> (String, Double)?
}

extension Figure {
    func calculator() -> (String, Double)? {
        return nil
    }
    
    func position(_ points: [MyPoint]) -> [Axis] {
        var coordinates = [Axis]()
        for point in points {
            let row = abs(24-point.y)+1
            let col = 2*point.x+3
            coordinates.append((row, col))
        }
        return coordinates
    }
}
