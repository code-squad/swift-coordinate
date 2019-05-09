//
//  Converter.swift
//  CoordinateCalculator
//
//  Created by CHOMINJI on 23/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Converter {
    
    static func toFigure(from input: String) -> Drawable? {
        let myPoints = toMyPoints(from: input)
        
        switch myPoints.count {
        case 1:
            return MyPoint(x: myPoints[0].x, y: myPoints[0].y)
        case 2:
            return MyLine(pointA: myPoints[0], pointB: myPoints[1])
        case 3:
            return MyTriangle(pointA: myPoints[0], pointB: myPoints[1], pointC: myPoints[2])
        case 4:
            return makeRect(points: myPoints)
        default:
            return nil
        }
    }
    
    static private func makeRect(points: [MyPoint]) -> Drawable? {
        guard Validator.canBeRect(points: points) else {
            return nil
        }
    
        let sortedPoints = points.sorted { (left, right) -> Bool in
            return (left.x, left.y) < (right.x, right.y)
        }
        print(sortedPoints)
        
        let leftTop = sortedPoints[1]
        let rightBottom = sortedPoints[2]
        let width = rightBottom.x - leftTop.x
        let height = leftTop.y - rightBottom.y
        let rectSize = CGSize(width: width, height: height)
        
        
        return MyRect(origin: leftTop, size: rectSize)
    }
    
    static private func toMyPoints(from input: String) -> [MyPoint] {
        var myPoints : [MyPoint] = []
        let trimmedInput = input.removeParenthesis().splitByHyphen().map{ $0.splitByComma().map { Int($0) ?? -1 } }
        
        guard Validator.checkCoordinatesLimit(coordinates: trimmedInput) else {
            return []
        }
        
        for input in trimmedInput {
            let point = MyPoint(x: input[0], y: input[1]).points
            myPoints += point
        }
        return myPoints
    }
}

extension String {
    
    func removeParenthesis() -> String {
        let trimmedInput = self.components(separatedBy: CharacterSet(charactersIn: "()")).joined()
        return trimmedInput
    }
    
    func splitByComma() -> [String] {
        return self.split(separator: ",").map({String($0)})
    }
    
    func splitByHyphen() -> [String] {
        return self.split(separator: "-").map({String($0)})
    }
    
}
