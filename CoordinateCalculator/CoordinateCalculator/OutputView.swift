//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by TaeHyeonLee on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    var points : Any?
    
    init(points: Any) {
        if points is MyPoint {
            self.points = points as! MyPoint
        } else if points is MyLine {
            self.points = points as! MyLine
        }
    }
    
    func drawAxis() {
        print("\(ANSICode.text.blueBright)\(ANSICode.axis.draw())")
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
    func drawPoints() {
        if self.points is MyPoint {
            let point = self.points as! MyPoint
            drawPoint(myPoint: point)
        } else if self.points is MyLine {
            let line = self.points as! MyLine
            drawLine(myLine: line)
        }
    }
    func getCalculateResult() {
        if self.points is MyPoint {
            print()
        } else if self.points is MyLine {
            let line = self.points as! MyLine
            print("\n두 점 사이 거리는 \(line.getDistance())\n")
        }
    }
}

