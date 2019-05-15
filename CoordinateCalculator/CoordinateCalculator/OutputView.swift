//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 15/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    static func drawAxis(_ point:(Int,Int)) {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
        let convertedCoordinate = convertToCoordinate(point)
        draw(convertedCoordinate)
    }
    
    private static func draw(_ point:MyPoint) {

        print("\(ANSICode.cursor.move(row: point.y, col: point.x))😼\(ANSICode.cursor.move(row: ANSICode.axis.AxisLimit+2, col: ANSICode.axis.AxisLimit+2))")
    
    }
    
    private static func convertToCoordinate(_ point:(Int,Int)) -> MyPoint {
        let convertedX = point.0 * 2 + 3
        let convertedY = ANSICode.axis.AxisLimit - point.1 + 1
        return MyPoint(x: convertedX, y: convertedY)
    }
    
}
