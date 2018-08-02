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
    
    public static func printCoordinates(coordinates:[MyPoint]) -> Bool {
        
        guard coordinates.count > 0 else { return false }
        
        // 기본 좌표 그리기
        OutputView.drawAxis()
        // 개수에 따라 좌표 찍기
        for p in coordinates {
            print("\(ANSICode.cursor.move(row:25 - p.valueY, col: p.valueX * 2 + 3))😀")
        }
        
        return true
    }
    
    public static func printMessage(shape: ShapeProtocol) -> Bool {
        print("\(ANSICode.cursor.move(row:27, col: 0))")
        print("\(ANSICode.text.redBright)")
        
        defer {
            initTextColor()
        }

        print("\(shape.message())\(shape.calculate())")
        
        return false
    }
    
}
