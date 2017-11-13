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
        } else if myShape?.type == Figure.line {
            printMyLine(myLine: myShape as! MyLine)
            printValueOfMyLineResult(myLine: myShape as! MyLine)
        } else if myShape?.type == Figure.triangle {
            printMyTriangle(myTriangle: myShape as! MyTriangle)
            printValueOfMyTriangleResult(myTriangle: myShape as! MyTriangle)
        }
    }
    
    func printMyPoint(myPoint: MyPoint) {
        print("\(myPoint.calculateOfPosition())")
    }
    
    func printMyLine(myLine: MyLine) {
        print("\(myLine.calculateOfPosition())")
    }
    
    func printMyTriangle(myTriangle: MyTriangle) {
        print("\(myTriangle.calculateOfPosition())")
    }

    func printValueOfMyLineResult(myLine: MyLine) {
        print("\(ANSICode.cursor.move(row: 30, col: -1))\(ANSICode.text.black)  두 점 사이 거리는 \(myLine.calculateOfLength())")
    }
    
    func printValueOfMyTriangleResult(myTriangle: MyTriangle) {
        print("\(ANSICode.cursor.move(row: 30, col: -1))\(ANSICode.text.black)  삼각형의 넓이는 \(myTriangle.calculateOfArea())")
    }
    
}
