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
    
    public static func printCoordinate(point:MyPoint) {
//        guard let valueX:Int = point.x else { return }
//        guard let valueY:Int = point.y else { return }
        let valueX:Int = point.x
        let valueY:Int = point.y
        print("valueX : \(valueX)")
        print("valueY : \(valueY)")
        print("\(ANSICode.cursor.move(row:25 - valueX, col: valueY * 2 + 3))\(ANSICode.text.redBright)&")
        print("\(ANSICode.cursor.move(row:26, col: 26))")
        initTextColor()
    }
    
}
