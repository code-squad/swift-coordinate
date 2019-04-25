//
//  FigureFactory.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/19/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct FigureFactory {
    static func getFigure(_ coordinates: [(x: Int, y: Int)]) throws -> Figure {
        switch coordinates.count {
        case 1: return MyPoint(x: coordinates[0].x, y: coordinates[0].y)
        case 2: return MyLine(pointA: MyPoint(x: coordinates[0].x, y: coordinates[0].y), pointB: MyPoint(x: coordinates[1].x, y: coordinates[1].y))
        case 3: return MyTriangle(pointA: MyPoint(x: coordinates[0].x, y: coordinates[0].y), pointB: MyPoint(x: coordinates[1].x, y: coordinates[1].y), pointC: MyPoint(x: coordinates[2].x, y: coordinates[2].y))
        case 4:
            let rectangleInfo = try verifyRectangle(coordinates)
            return MyRect(origin: rectangleInfo.0, size: rectangleInfo.1)
        default: throw InputError.UndefinedFigure
        }
    }
    
    static private func inputToRectangle (_ point: MyPoint, _ size: CGSize) -> MyRect {
        return MyRect(origin: point, size: size)
    }
    
    static private func verifyRectangle (_ coordinates: [(x: Int, y: Int)]) throws -> (MyPoint, CGSize) {
        let minMax = getMinMax(coordinates)
        try countCheckMinMax(coordinates, minMax)
        
        let minX = minMax[0]
        let maxX = minMax[1]
        let minY = minMax[2]
        let maxY = minMax[3]
        
        return (MyPoint(x: minX, y: minY), CGSize.init(width: maxX-minX, height: maxY-minY))
    }
    
    static private func getMinMax (_ coordinates: [(x: Int, y: Int)]) -> [Int] {
        var maxX = 0; var minX = 24; var minY = 24; var maxY = 0
        
        for coordinate in coordinates {
            if coordinate.x > maxX { maxX = coordinate.x }
            if coordinate.x < minX { minX = coordinate.x }
            if coordinate.y > maxY { maxY = coordinate.y }
            if coordinate.y < minY { minY = coordinate.y }
        }
        
        return [minX, maxX, minY, maxY]
    }
    
    static private func countCheckMinMax (_ coordinates: [(x: Int, y: Int)], _ minMaxCoordinates: [Int]) throws
    {
        var minXCount = 0; var maxXCount = 0; var minYCount = 0; var maxYCount = 0
    
        for coordinate in coordinates {
            if coordinate.x == minMaxCoordinates[0] { minXCount += 1 }
            if coordinate.x == minMaxCoordinates[1] { maxXCount += 1 }
            if coordinate.y == minMaxCoordinates[2] { minYCount += 1 }
            if coordinate.y == minMaxCoordinates[3] { maxYCount += 1 }
        }
        
        if maxXCount != 2 || maxYCount != 2 || minXCount != 2 || minYCount != 2 {
            throw InputError.NotRectangle
        }
    }
}
