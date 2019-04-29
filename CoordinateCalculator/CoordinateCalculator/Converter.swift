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

        guard let myPoints = toMyPoints(from: input) else {
            return nil
        }
        
        switch myPoints.count {
        case 2:
            return MyLine(pointA: myPoints[0], pointB: myPoints[1])
        default:
            return MyPoint(x: myPoints[0].x, y: myPoints[0].y)
        }
    }
    
    static private func toMyPoints(from input: String) -> [MyPoint]? {
        
        var myPoints : [MyPoint] = []
        let trimmedInput = input.removeParenthesis().splitByHyphen()
        
        for input in trimmedInput {
            
            let coordinateValue = input.splitByComma().map { Int($0) ?? -1 }
            
            guard let point = createPoint(using: coordinateValue) else {
                return nil
            }
            
            myPoints.append(point)
        }
        
        return myPoints
    }
    
    static private func createPoint(using coordinateValue: [Int]) -> MyPoint? {
        
        guard Validator.checkCoordinatesLimit(coordinates: coordinateValue) else {
            return nil
        }
        
        let point = MyPoint(x: coordinateValue[0], y: coordinateValue[1])
        
        return point
        
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
