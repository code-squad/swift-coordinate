//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by yangpc on 2017. 10. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    static func removeText() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    static func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static func printPoint(point: MyPoint) {
        let row = abs(24-point.y)+1
        let col = 2*point.x+1
        print("\(ANSICode.cursor.move(row: row, col: col))\(ANSICode.text.whiteBright) ⦁")
    }
    
    static func printLine(line: MyLine) {
        let rowA = abs(24-line.pointA.y)+1
        let colA = 2*line.pointA.x+1
        print("\(ANSICode.cursor.move(row: rowA, col: colA))\(ANSICode.text.whiteBright) ⦁")
        let rowB = abs(24-line.pointB.y)+1
        let colB = 2*line.pointB.x+1
        print("\(ANSICode.cursor.move(row: rowB, col: colB))\(ANSICode.text.whiteBright) ⦁")
    }
}
