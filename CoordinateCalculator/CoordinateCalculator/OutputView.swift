//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by Eunjin Kim on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
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
            printValueOfResult(myShape: myShape as! MyLine)
        }
    }
    
    func printMyPoint(myPoint: MyPoint) {
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - myPoint.y, col: (myPoint.x * 2) + 3))\(ANSICode.text.dot)")
    }
    
    func printMyLine(myLine: MyLine) {
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - myLine.pointA.y, col: (myLine.pointA.x * 2) + 3))\(ANSICode.text.dot)")
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - myLine.pointB.y, col: (myLine.pointB.x * 2) + 3))\(ANSICode.text.dot)")
    }
    
    func printValueOfResult(myShape: MyLine) {
        //제곱근((A.x - B.x)^제곱 + (A.y - B.y)^제곱)
        let result = sqrt(abs(pow(Double(myShape.pointA.x - myShape.pointB.x),2) + pow(Double(myShape.pointA.y - myShape.pointB.y),2)))
        print("\(ANSICode.cursor.move(row: 30, col: -1))\(ANSICode.text.black)  두 점 사이 거리는 \(result)")
    }

}
