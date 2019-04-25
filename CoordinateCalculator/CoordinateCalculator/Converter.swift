//
//  Converter.swift
//  CoordinateCalculator
//
//  Created by CHOMINJI on 23/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Converter {
    
    static func toMyPoints(using input: String) -> [MyPoint] {

        var myPoints : [MyPoint] = []
        
        let coordinates = input.components(separatedBy: "-").map { $0.trimmingCharacters(in: CharacterSet(charactersIn: "()")).components(separatedBy: ",") }
        
        for coordinate in coordinates {
            
            let point = coordinate.map { Int($0)! }
            
            myPoints.append(MyPoint(x:point[0], y: point[1]))
        }
        
        return myPoints
    }
}
