//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by yangpc on 2017. 10. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    func removeText() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    func printPoint(point: MyPoint) {
        let row = abs(24-point.y)+1
        let col = 2*point.x+1
        print("\(ANSICode.cursor.move(row: row, col: col))\(ANSICode.text.whiteBright) ⦁")
    }
}
