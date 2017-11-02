//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by TaeHyeonLee on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    private(set) var figure : Figure?
    
    init(figure: Figure) {
        self.figure = figure
    }
    
    func drawAll() {
        clearAxis()
        drawPoints()
        drawAxis()
        getCalculateResult()
    }
    
    private func clearAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    private func drawPoints() {
        var result : String = "\(ANSICode.text.redBright)"
        for point in (self.figure?.points)! {
            result += "\(ANSICode.home)\(ANSICode.cursor.move(row: ANSICode.axis.AxisLimit + 1 - point.y, col: point.x * 2 + 3))●"
        }
        print(result)
    }
    
    private func drawAxis() {
        print("\(ANSICode.text.blueBright)\(ANSICode.axis.draw())")
    }
    
    private func getCalculateResult() {
        if self.figure is MyPoint {
            print()
        } else if self.figure is MyLine {
            let line = self.figure as! MyLine
            print("\n두 점 사이 거리는 \(line.getDistance())\n")
        } else if self.figure is MyTriangle {
            let triangle = self.figure as! MyTriangle
            print("\n삼각형의 넓이는 \(triangle.getArea())\n")
        }
    }
}

