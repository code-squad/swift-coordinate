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
    
    private static func calculateByShape(coordinates:[MyPoint]) -> Bool {
        switch coordinates.count {
        case 1: // point
            MyPoint.takeCoordinates(points: coordinates)
            return false
        case 2: // line
            MyLine.takeCoordinates(points: coordinates)
            return false
        case 3: // triangle
            MyTriangle.takeCoordinates(points: coordinates)
            return false
        default:
            /*
             좌표값 범위를 넘거나 입력할 수 없는 문자가 포함된 경우 빈값을 리턴받아 해당 부분에 들어옵니다.
             또한, 원하는 값 이상으로 좌표가 입력된 경우에도 해당 부분으로 들어옵니다.
             */
            return true
        }
    }
    
    // coordinates 개수에 따라 분류하는 함수
    public static func printCoordinates(coordinates:[MyPoint]) -> Bool {
        OutputView.drawAxis() // 기본 좌표 그리기
        // 개수에 따라 좌표 찍기
        for p in coordinates {
            print("\(ANSICode.cursor.move(row:25 - p.valueY, col: p.valueX * 2 + 3))\(ANSICode.text.redBright)😀")
        }
        defer {
            initTextColor() // 글자 색상 기본 변경
        }
        let isValueInRange = calculateByShape(coordinates: coordinates)
        return isValueInRange
        
    }
}
