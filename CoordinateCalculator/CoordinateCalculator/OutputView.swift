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
    
    private static func drawPoint(_ point: MyPoint) {
        print("\(ANSICode.cursor.move(row: originOfY - point.y, col: originOfX + point.x * 2))\(marker)")
    }
    
    private static func showCalculationResult(of shape: CalculableShape) {
        print("\(shape.calculationMessage)\(shape.calculate())")
    }
    
    private static func drawPoints(_ shape: Shape) {
        for point in shape.points {
            drawPoint(point)
        }
        moveCursorToEnd()
        guard let calculableShape: CalculableShape = shape as? CalculableShape else { return }
        showCalculationResult(of: calculableShape)
    }
    
    static func drawShape(_ shape: Shape?) {
        guard let shape = shape else { return }
        drawAxis()
        drawPoints(shape)
    }
    
    static func printMessageOfTextInvalidation() {
        print("\(TextValidation.invalidForm.rawValue) \(TextValidation.outOfRangeInt.rawValue)")
    }
    
    static func printMessage(of coordinatesValidation: TextValidation) {
        print(coordinatesValidation.rawValue)
    }
}
