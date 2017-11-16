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
    subscript(i: Int) -> MyPoint {
        return points[i]
    }
}

struct Figure {
    func getFigureModel(in points: [MyPoint]) throws -> Figurable? {
        switch points.count {
        case 1:
            return convertMyPoint(points)
        case 2:
            return convertMyLine(points)
        case 3:
            return convertMyTriangle(points)
        case 4:
            return try convertMyRect(points)
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
    
    private func convertMyTriangle(_ points: [MyPoint]) -> MyTriangle {
        return MyTriangle(points: points)
    }
    
    private func convertMyRect(_ points: [MyPoint]) throws -> MyRect {
        let sortedPoints = points.sorted(by: Utility.sortPoints)
        
        guard Utility.isRectangle(in: sortedPoints) else {
            throw OutputView.Errors.notRectagle
        }
        
        return MyRect(points: sortedPoints)
    }
}
