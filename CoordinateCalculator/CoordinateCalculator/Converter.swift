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
        default:
            return nil
        }
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
