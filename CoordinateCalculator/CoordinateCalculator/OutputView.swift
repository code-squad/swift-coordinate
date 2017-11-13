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
        print("\(myPoint.calculatorOfPosition())")
    }
    
    func printMyLine(myLine: MyLine) {
        print("\(myLine.calculatorOfPosition())")
        print("\(myLine.printValueOfResult())")
    }

}
