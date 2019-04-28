//
//  Converter.swift
//  CoordinateCalculator
//
//  Created by CHOMINJI on 23/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Converter {
    
    static func toMyPoints(using input: String) -> Drawable  {

        var myPoints : [MyPoint] = []
        
        let coordinates = input.components(separatedBy: "-").map { $0.trimmingCharacters(in: CharacterSet(charactersIn: "()")).components(separatedBy: ",") }
        
        for coordinate in coordinates {
            
            let point = coordinate.map { Int($0)! }
            
            myPoints.append(MyPoint(x:point[0], y: point[1]))
        }
        
        switch myPoints.count {
        case 2:
            return MyLine(pointA: myPoints[0], pointB: myPoints[1])
        default:
            return MyPoint(x: myPoints[0].x, y: myPoints[0].y)
        }
       
    }
}
