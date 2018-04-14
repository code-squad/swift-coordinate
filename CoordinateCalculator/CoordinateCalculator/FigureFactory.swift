//
//  FigureMaker.swift
//  CoordinateCalculator
//
//  Created by moon on 2018. 4. 7..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

enum FigureType: Int {
    case line = 2
    case triangle = 3
    case rectangle = 4
}

struct FigureFactory {
    
    static private let hyphen: Character = "-"
    static private let meaninglessCharacters: CharacterSet = ["(", ")", ","]
    
    static func makeFigure(_ myPoints: [MyPoint]) throws -> Figure {
        switch myPoints.count {
        case FigureType.line.rawValue:
            return MyLine(myPoints)
        case FigureType.triangle.rawValue:
            return MyTriangle(myPoints)
        case FigureType.rectangle.rawValue:
            let (origin, size) = try FigureFactory.makeOriginAndSize(myPoints)
            return MyRect(origin: origin, size: size)
        default:
            return MyPoint(x: myPoints[0].x, y: myPoints[0].y)
        }
    }
    
    static func makeOriginAndSize(_ myPoints: [MyPoint]) throws -> (MyPoint, CGSize) {
        var xSet = Set<Int>()
        var ySet = Set<Int>()
        
        for myPoint in myPoints {
            xSet.insert(myPoint.x)
            ySet.insert(myPoint.y)
        }
        
        // 직사각형만 허용
        guard xSet.count == 2 && ySet.count == 2 else {
            throw InputError.rectangleError
        }
        
        // origin은 topLeft(x는 가장 작고 y는 가장크고)
        let origin = MyPoint(x: xSet.min()!, y: ySet.max()!)
        let size = CGSize(width: xSet.max()! - origin.x, height: origin.y - ySet.min()!)
        
        return (origin, size)
    }
    
    static func makeMyPoints(_ userInput: String) -> [MyPoint] {
        let splited: [String] = self.splitByHyphen(in: userInput)
        let coordinates: [[Int]] = self.getCoordinateFrom(textCoordinates: splited)
        let myPoints: [MyPoint] = self.makeMyPoints(coordinates)
        
        return myPoints
    }
    
    static private func splitByHyphen(in text: String) -> [String] {
        return text.split(separator: self.hyphen).map(String.init)
    }
    
    static private func getCoordinateFrom(textCoordinates: [String]) -> [[Int]] {
        var coordinates = [[Int]]()
        for textCoordinate in textCoordinates {
            coordinates.append(textCoordinate.components(separatedBy: self.meaninglessCharacters).compactMap { Int($0) })
        }
        
        return coordinates
    }
    
    static private func makeMyPoints(_ coordinates: [[Int]]) -> [MyPoint] {
        var myPoints = [MyPoint]()
        
        for coordinate in coordinates {
            myPoints.append(MyPoint(x: coordinate[0], y: coordinate[1]))
        }
        
        return myPoints
    }
}
