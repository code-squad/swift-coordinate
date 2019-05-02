//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    static public func draw(_ figure: AxisDrawable) {
        drawAxis()
        drawYellowDot(using: figure)
        moveToLineBelowAxis()
        if let figureWithValue = figure as? ValueComputable {
            printComputedValue(of: figureWithValue)
        }
    }
    
    static private func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static private func drawYellowDot(using figure: AxisDrawable) {
        let yellowDot = ANSICode.text.yellowBright + ANSICode.dot
        let points = figure.points
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
    
    static private func moveCursorToOrigin() {
        let moveToOrigin = ANSICode.cursor.move(row: ANSICode.axis.originRow, col: ANSICode.axis.originCol)
        print(moveToOrigin)
    }
    
    static private func moveToLineBelowAxis() {
        let rowBelowAxis = ANSICode.axis.originRow + 1
        let directionBelowAxis = ANSICode.cursor.move(row: rowBelowAxis, col: ANSICode.axis.originCol)
        print(directionBelowAxis)
    }
    
    static private func printComputedValue(of figure: ValueComputable) {
        var description = "\(ANSICode.text.whiteBright)"
        description += figure.description
        let computedValue = figure.getComputedValue()
        print(description, computedValue)
    }
    
}

