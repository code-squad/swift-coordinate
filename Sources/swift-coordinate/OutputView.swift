//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by TaeHyeonLee on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    func clearAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    func drawPoint(myPoint: MyPoint) {
        print("\(ANSICode.home)\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: ANSICode.axis.AxisLimit + 1 - myPoint.y, col: myPoint.x * 2 + 3))●")
    }
    func drawLine(myLine: MyLine) {
        print("\(ANSICode.home)\(ANSICode.text.magentaBright)\(ANSICode.cursor.move(row: ANSICode.axis.AxisLimit + 1 - myLine.pointA.y, col: myLine.pointA.x * 2 + 3))●\(ANSICode.home)\(ANSICode.cursor.move(row: ANSICode.axis.AxisLimit + 1 - myLine.pointB.y, col: myLine.pointB.x * 2 + 3))●")
    }
    func drawPoints(points: Any) {
        if points is MyPoint {
            let point = points as! MyPoint
            drawPoint(myPoint: point)
        } else if points is MyLine {
            let line = points as! MyLine
            drawLine(myLine: line)
        }
    }
}

