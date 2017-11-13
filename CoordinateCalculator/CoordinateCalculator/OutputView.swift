//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by Eunjin Kim on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    enum Figure {
        case point
        case line
        case triangle
    }
    
    func drawClear() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    func printMyShape(myShape: MyShape?) {
        if myShape?.type == Figure.point {
            printMyPoint(myPoint: myShape as! MyPoint )
        } else {
            printMyLine(myLine: myShape as! MyLine)
            printValueOfResult(myLine: myShape as! MyLine)
        }
    }
    
    func printMyPoint(myPoint: MyPoint) {
        print("\(myPoint.calculateOfPosition())")
    }
    
    func printMyLine(myLine: MyLine) {
        print("\(myLine.calculateOfPosition())")
    }

    func printValueOfResult(myLine: MyLine) {
        print("\(ANSICode.cursor.move(row: 30, col: -1))\(ANSICode.text.black)  두 점 사이 거리는 \(myLine.calculateOfLength())")
    }
    
}
