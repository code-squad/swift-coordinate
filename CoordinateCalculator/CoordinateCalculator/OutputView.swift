//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by CHOMINJI on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    var point: MyPoint
    
    func drawPoint() {
        let translatedPoint = translatePointPosition(of: point)
        var result = ANSICode.cursor.move(row: translatedPoint.y, col: translatedPoint.x)
        result += ANSICode.text.redBright
        result += "µ"
        result += restoreCursor()
        print(result)
    }
    
    private func restoreCursor() -> String {
        let restoredCursor = ANSICode.cursor.move(row: 26, col: 26)
        return restoredCursor
    }
    
    private func translatePointPosition(of point: MyPoint) -> MyPoint {
        let translatedX = point.x * 2 + 3
        let translatedY = 25 - point.y
        return MyPoint(x: translatedX, y: translatedY)
    }
    
    func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
}


