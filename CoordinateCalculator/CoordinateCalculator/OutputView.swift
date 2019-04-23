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
    
    static public func drawYellowDot(at point: MyPoint) {
        if isImpossibleToDraw(at: point) {
            noticeOutOfAxisToDraw(at: point)
            return
        }
        let yellowDot = ANSICode.text.yellowBright + ANSICode.dot
        let drawingDirection = getDirectionToDraw(yellowDot, at: point)
        print(drawingDirection)
        moveCursorToOrigin()
    }
    
    static private func isImpossibleToDraw(at point: MyPoint) -> Bool {
        return point.x > ANSICode.axis.AxisLimit || point.y > ANSICode.axis.AxisLimit || point.x < 0 || point.y < 0
    }
    
    static private func noticeOutOfAxisToDraw(at point: MyPoint) {
        print("point (\(point.x),\(point.y)) is out of axis.")
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

