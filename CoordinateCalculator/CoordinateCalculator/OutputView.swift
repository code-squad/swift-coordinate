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
        let myLine = MyLine.init(pointA: line.a, pointB: line.b)
        print("\(ANSICode.cursor.move(row:25 - myLine.a.valueX, col: myLine.a.valueY * 2 + 3))\(ANSICode.text.redBright)😀")
        print("\(ANSICode.cursor.move(row:25 - myLine.b.valueX, col: myLine.b.valueY * 2 + 3))\(ANSICode.text.redBright)😀")
        print("\(ANSICode.cursor.move(row:27, col: 0))")
        print("두 점 사이의 거리는 \(myLine.distance())")
        print("\(ANSICode.cursor.move(row:28, col: 28))")
        initTextColor()
    }
    
}
