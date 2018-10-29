//
//  ValidCheck.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 2018. 10. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

extension String {
    func isValidCharacter() -> Bool {
        return !isEmpty && range(of: "[^0-9(),-]", options: .regularExpression) == nil
    }
}

struct Check {
    static func isValidSize(_ points:[MyPoint]) -> Bool {
        for i in points {
            guard i.readX() <= ANSICode.axis.AxisLimit && i.readY() <= ANSICode.axis.AxisLimit else {return false}
        }
        return true
    }
    
    static func isValidNumberOfCoordinates(_ points:[MyPoint]) -> Bool {
        guard points.count <= 4 else {return false}
        return true
    }
    
    static func isRect(_ points:[MyPoint]) -> Bool {
        guard points.count == 4 else {return true}
        var xCollection : Set<Int> = []
        var yCollection : Set<Int> = []
        for point in points {
            xCollection.insert(point.readX())
            yCollection.insert(point.readY())
        }
        return xCollection.count == 2 && yCollection.count == 2
    }
}
