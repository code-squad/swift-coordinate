//
//  FigureFactory.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/19/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct FigureFactory {
    static func getFigure(_ values: [String]) throws -> Figure {
        switch values.count {
        case 1: return inputToPoint(values[0])
        case 2: return MyLine(pointA: inputToPoint(values[0]), pointB: inputToPoint(values[1]))
        case 3: return MyTriangle(pointA: inputToPoint(values[0]), pointB: inputToPoint(values[1]), pointC: inputToPoint(values[2]))
        case 4:
            let rectangleInfo = try verifyRectangle(values)
            return MyRect(origin: rectangleInfo.0, size: rectangleInfo.1)
        default: throw InputError.UndefinedFigure
        }
    }

    static private func inputToPoint (_ valueEntered: String) -> MyPoint {
        var value = valueEntered
        
        value.removeFirst()
        value.removeLast()
        
        let coordinate = value.split(separator: ",")
        let coordinateX: Int = Int(String(coordinate[0])) ?? 0
        let coordinateY: Int = Int(String(coordinate[1])) ?? 0
        
        return MyPoint(x: coordinateX, y: coordinateY)
    }
    
    static private func inputToRectangle (_ point: MyPoint, _ size: CGSize) -> MyRect {
        return MyRect(origin: point, size: size)
    }
    
    static private func verifyRectangle (_ valueEntered: [String]) throws -> (MyPoint, CGSize) {
        let minMaxCoordinates = getMinMaxCoordinate(valueEntered)
        try countCheckMinMaxCoordinate(valueEntered, minMaxCoordinates)
        
        let minX = minMaxCoordinates[0]
        let maxX = minMaxCoordinates[1]
        let minY = minMaxCoordinates[2]
        let maxY = minMaxCoordinates[3]
        
        return (MyPoint(x: minX, y: minY), CGSize.init(width: maxX-minX, height: maxY-minY))
    }
    
    static private func getMinMaxCoordinate (_ valueEntered: [String]) -> [Int] {
        var maxX = 0; var minX = 24; var minY = 24; var maxY = 0
        var coordinate: [Substring]; var coordinateX: Int; var coordinateY: Int
        
        for valueOrigin in valueEntered {
            var value = valueOrigin
            value.removeFirst()
            value.removeLast()
            coordinate = value.split(separator: ",")
            coordinateX = Int(String(coordinate[0])) ?? 0
            coordinateY = Int(String(coordinate[1])) ?? 0
            
            if coordinateX > maxX { maxX = coordinateX }
            if coordinateX < minX { minX = coordinateX }
            if coordinateY > maxY { maxY = coordinateY }
            if coordinateY < minY { minY = coordinateY }
        }
        
        return [minX, maxX, minY, maxY]
    }
    
    static private func countCheckMinMaxCoordinate (_ valueEntered: [String], _ minMaxCoordinates: [Int]) throws
    {
        var minXCount = 0; var maxXCount = 0; var minYCount = 0; var maxYCount = 0
        var coordinate: [Substring]; var coordinateX: Int; var coordinateY: Int
    
        for valueOrigin in valueEntered {
            var value = valueOrigin
            value.removeFirst()
            value.removeLast()
            coordinate = value.split(separator: ",")
            coordinateX = Int(String(coordinate[0])) ?? 0
            coordinateY = Int(String(coordinate[1])) ?? 0
            
            if coordinateX == minMaxCoordinates[0] { minXCount += 1 }
            if coordinateX == minMaxCoordinates[1] { maxXCount += 1 }
            if coordinateY == minMaxCoordinates[2] { minYCount += 1 }
            if coordinateY == minMaxCoordinates[3] { maxYCount += 1 }
        }
        
        if maxXCount != 2 || maxYCount != 2 || minXCount != 2 || minYCount != 2 {
            throw InputError.NotRectangle
        }
    }
}
