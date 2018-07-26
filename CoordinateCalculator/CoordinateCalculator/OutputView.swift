//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by oingbong on 2018. 7. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    private static func initTextColor() {
        print("\(ANSICode.text.whiteBright)")
    }
    
    private static func clear() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    public static func drawAxis() {
        clear()
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    private static func convertSquare(number:Int) -> Int {
        return number * number
    }
    
    // MyPoint
    public static func printCoordinateMyPoint(point:MyPoint) {
        let valueX:Int = point.valueX
        let valueY:Int = point.valueY
        print("\(ANSICode.cursor.move(row:25 - valueX, col: valueY * 2 + 3))\(ANSICode.text.redBright)😀")
        print("\(ANSICode.cursor.move(row:26, col: 26))")
        initTextColor()
    }
    // MyLine
    public static func printCoordinateMyLine(line:MyLine) {
        let pointA:MyPoint = line.a
        let pointB:MyPoint = line.b
        print("\(ANSICode.cursor.move(row:25 - pointA.valueX, col: pointA.valueY * 2 + 3))\(ANSICode.text.redBright)😀")
        print("\(ANSICode.cursor.move(row:25 - pointB.valueX, col: pointB.valueY * 2 + 3))\(ANSICode.text.redBright)😀")
        // 두 점 사이 거리는 제곱근((A.x - B.x)^제곱 + (A.y - B.y)^제곱) 공식으로 계산할 수 있다.
        // (A.x - B.x) * (A.x - B.x) + (A.y - B.y) * (A.y - B.y)
        let valueX = convertSquare(number: pointA.valueX - pointB.valueX)
        let valueY = convertSquare(number: pointA.valueY - pointB.valueY)
        let distanceOfPoint = sqrt(Double(valueX + valueY))
        print("\(ANSICode.cursor.move(row:27, col: 0))")
        print("두 점 사이의 거리는 \(distanceOfPoint)")
        print("\(ANSICode.cursor.move(row:28, col: 28))")
        initTextColor()
    }
    
}
