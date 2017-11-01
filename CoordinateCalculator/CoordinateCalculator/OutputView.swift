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
    
    func drawPoints() {
        var result : String = "\(ANSICode.text.redBright)"
        for point in (self.points?.points)! {
            result += "\(ANSICode.home)\(ANSICode.cursor.move(row: ANSICode.axis.AxisLimit + 1 - point.y, col: point.x * 2 + 3))●"
        }
        print(result)
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

