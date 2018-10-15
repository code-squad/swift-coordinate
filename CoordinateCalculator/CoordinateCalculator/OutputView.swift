//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 윤지영 on 04/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    private static let originOfX = 3
    private static let originOfY = 25
    private static let marker = "🔵"
    
    private static func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    private static func moveCursorToEnd() {
        print("\(ANSICode.cursor.move(row: originOfY + 1, col: originOfX))")
    }
    
    static func drawPoint(_ point:MyPoint) {
        print("\(ANSICode.cursor.move(row: originOfY - point.y, col: originOfX + point.x * 2))\(marker)")
    }
    
    private static func showCalculationResult(of shape: CalculableShape) {
        print("\(shape.calculationMessage)\(shape.calculate())")
    }
    
    static func drawPoints(_ shape: CalculableShape) {
        for point in shape.points {
            drawPoint(point)
        }
        moveCursorToEnd()
        showCalculationResult(of: shape)
    }
    
    static func drawShape(_ shape: Shape?) {
        guard let shape = shape else { return }
        drawAxis()
        if (shape.points.count==1) {
            drawPoint(shape.points[shape.points.startIndex])
            moveCursorToEnd()
            return
        }
        drawPoints(shape as! CalculableShape)
    }
}
