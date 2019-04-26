//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    static public func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static public func drawYellowDot(using figure: AxisDrawable) {
        let yellowDot = ANSICode.text.yellowBright + ANSICode.dot
        let points = figure.getPoints()
        for point in points {
            let drawingDirection = getDirectionToDraw(yellowDot, at: point)
            print(drawingDirection)
        }
        moveCursorToOrigin()
    }
    
    static private func getDirectionToDraw(_ dot: String, at point: MyPoint) -> String {
        let pointRow = ANSICode.axis.AxisLimit - point.y + 1
        let pointCol = point.x * 2 + 3
        let direction = ANSICode.cursor.move(row: pointRow, col: pointCol) + dot
        return direction
    }
    
    static func moveCursorToOrigin() {
        let moveToOrigin = ANSICode.cursor.move(row: ANSICode.axis.originRow, col: ANSICode.axis.originCol)
        print(moveToOrigin)
    }
    
    
}

