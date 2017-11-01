//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by TaeHyeonLee on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    var points : Points?
    
    init(points: Points) {
        if points is MyPoint {
            self.points = points as! MyPoint
        } else if points is MyLine {
            self.points = points as! MyLine
        } else if points is MyTriangle {
            self.points = points as! MyTriangle
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
    func drawTriangle(myTriangle: MyTriangle) {
        print("\(ANSICode.home)\(ANSICode.text.magentaBright)\(ANSICode.cursor.move(row: ANSICode.axis.AxisLimit + 1 - myTriangle.points[0].y, col: myTriangle.points[0].x * 2 + 3))●\(ANSICode.home)\(ANSICode.cursor.move(row: ANSICode.axis.AxisLimit + 1 - myTriangle.points[1].y, col: myTriangle.points[1].x * 2 + 3))●\(ANSICode.home)\(ANSICode.cursor.move(row: ANSICode.axis.AxisLimit + 1 - myTriangle.points[2].y, col: myTriangle.points[2].x * 2 + 3))●")
    }
    func drawPoints() {
        if self.points is MyPoint {
            let point = self.points as! MyPoint
            drawPoint(myPoint: point)
        } else if self.points is MyLine {
            let line = self.points as! MyLine
            drawLine(myLine: line)
        } else if self.points is MyTriangle {
            let triangle = self.points as! MyTriangle
            drawTriangle(myTriangle: triangle)
        }
    }
    func getCalculateResult() {
        if self.points is MyPoint {
            print()
        } else if self.points is MyLine {
            let line = self.points as! MyLine
            print("\n두 점 사이 거리는 \(line.getDistance())\n")
        } else if self.points is MyTriangle {
            let triangle = self.points as! MyTriangle
            print("\n삼각형의 넓이는 \(triangle.getArea())\n")
        }
    }
}

