//
//  OutView.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/18/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    func drawAxis () {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    func drawFigure (_ figure: Figure?, _ type: FigureType?) {
        print("\(ANSICode.text.yellowBright)")
        switch type {
        case .point?: drawPoint(figure as! MyPoint)
        case .line?: drawLine(figure as! MyLine)
        case .triangle?: drawTriangle(figure as! MyTriangle)
        case .none: break
        }
    }
    func drawPoint (_ point: MyPoint) {
        print("\(ANSICode.cursor.move(row:25-point.y, col: point.x*2+3))•\(ANSICode.cursor.move(row:26, col: 0))")
    }
    func drawLine (_ line: MyLine) {
        drawPoint(line.pointA)
        drawPoint(line.pointB)
        print("\(ANSICode.text.whiteBright)두 점 사이의 거리는  \(line.length)")
    }
    func drawTriangle (_ triangle: MyTriangle) {
        drawPoint(triangle.lineAB.pointA)
        drawPoint(triangle.lineAB.pointB)
        drawPoint(triangle.lineAC.pointB)
        print("\(ANSICode.text.whiteBright)삼각형의 넓이는  \(triangle.area)")
    }
}
