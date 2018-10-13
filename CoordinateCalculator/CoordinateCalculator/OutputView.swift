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
    private static let distanceMessage = "두 점 사이의 거리는 "
    private static let marker = "🔵"
    
    private static func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    private static func moveCursorToEnd() {
        print("\(ANSICode.cursor.move(row: originOfY + 1, col: originOfX))")
    }
    
    static func drawPoint(point:MyPoint) {
        drawAxis()
        print("\(ANSICode.cursor.move(row: originOfY - point.y, col: originOfX + point.x * 2))\(marker)")
        moveCursorToEnd()
    }
    
    private static func calculateDistance(between pointA:MyPoint, and pointB:MyPoint) {
        let distance = sqrt(pow(Double(pointA.x-pointB.x), 2) + pow(Double(pointA.y-pointB.y), 2))
        print("\(distanceMessage)\(distance)")
    }
    
    static func drawLine(line:MyLine) {
        drawAxis()
        drawPoint(point: line.pointA)
        drawPoint(point: line.pointB)
        calculateDistance(between: line.pointA, and: line.pointB)
        moveCursorToEnd()
    }
}
