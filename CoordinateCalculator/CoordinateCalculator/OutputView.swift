//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by CHOMINJI on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    static let AxisLimit = ANSICode.axis.AxisLimit
    
    static func draw(point: MyPoint) {
        drawAxis()
        drawDot(at: point)
    }
    
    static private func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static private func drawDot(at point: MyPoint) {
        let translatedPoint = translatePointPosition(of: point)
        var result = ANSICode.cursor.move(row: translatedPoint.y, col: translatedPoint.x)
        result += ANSICode.text.redBright
        result += "µ"
        result += restoreCursor()
        print(result)
    }
    
    static private func restoreCursor() -> String {
        let restoredCursor = ANSICode.cursor.move(row: AxisLimit + 2, col: AxisLimit + 2)
        return restoredCursor
    }
    
    static private func translatePointPosition(of point: MyPoint) -> MyPoint {
        let translatedX = point.x * 2 + 3
        let translatedY = AxisLimit - point.y + 1
        return MyPoint(x: translatedX, y: translatedY)
    }
}


