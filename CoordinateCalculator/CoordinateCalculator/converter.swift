//
//  converter.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 15/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Converter {
    
    static func convertToCoordinate(_ point: MyPoint) -> MyPoint {
        let translatedX = point.x * 2 + 3
        let translatedY = ANSICode.axis.AxisLimit - point.y + 1
        return MyPoint(x: translatedX, y: translatedY)
    }
    
}
