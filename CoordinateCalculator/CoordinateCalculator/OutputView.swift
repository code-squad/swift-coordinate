//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by Huan Suh on 2018. 7. 8..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    let AxisLimit = ANSICode.axis.AxisLimit
    
    public static func clear() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    public func printFigure(figure : Figure) {
        let points = figure.getPoints()
        let isValid = drawPoints(points : points)
        
        print("\(ANSICode.cursor.move(row:AxisLimit + 3, col: 0))")
        if(isValid) {
            print(figure.description)
        } else {
            print("잘못된 좌표값입니다. (0 ~ \(AxisLimit))")
        }
    }
    
    private func drawPoints(points : [MyFigures.MyPoint]) -> Bool {
        OutputView.clear()
        drawAxis()
        var isValid = true
        for pt in points {
            if(checkValid(pt: pt)) {
                drawPoint(pt : pt)
            } else {
                isValid = false
            }
        }
        
        return isValid
    }
    
    private func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    private func drawPoint(pt : MyFigures.MyPoint) {
        print("\(ANSICode.text.yellow)\(ANSICode.cursor.move(row:ANSICode.axis.AxisLimit - pt.y + 1, col: pt.x * 2 + 3))*")
        print("\(ANSICode.text.whiteBright)")
    }
    
    private func checkValid(pt : MyFigures.MyPoint) -> Bool {
        if(pt.x < 0 || pt.x > AxisLimit) {
            return false
        }
        if(pt.y < 0 || pt.y > AxisLimit) {
            return false
        }
        return true
    }
}
