//
//  Figure.swift
//  CoordinateCalculator
//
//  Created by yuaming on 2017. 11. 9..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Figurable {
    func calculate() -> Double
    var points: [MyPoint] { get }
}

extension Figurable {
    var getPoints: [MyPoint] {
        get {
            return points
        }
    }
    
    subscript(i: Int) -> MyPoint {
        return points[i]
    }
}

struct Figure {
    func getFigureModel(in points: [MyPoint]) -> Figurable? {
        switch points.count {
        case 1:
            return convertMyPoint(points)
        case 2:
            return convertMyLine(points)
        default:
            return nil
        }
    }
    
    private func convertMyPoint(_ points: [MyPoint]) -> MyPoint {
        return MyPoint(points: points)
    }
    
    private func convertMyLine(_ points: [MyPoint]) -> MyLine {
        return MyLine(points: points)
    }
}
