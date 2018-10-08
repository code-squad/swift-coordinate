//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 윤지영 on 04/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    private static let originOfCoordinates = MyPoint(x:3,y:25)
    private static let marker = "🔵"
    
    private static func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    private static func moveCursorToEnd() {
        print("\(ANSICode.cursor.move(row:originOfCoordinates.y+1, col: originOfCoordinates.x))")
    }
    
    static func drawPoint(point:MyPoint) {
        drawAxis()
        print("\(ANSICode.cursor.move(row:originOfCoordinates.y - point.y, col:originOfCoordinates.x + point.x*2))\(marker)")
        moveCursorToEnd()
    }
    
}
