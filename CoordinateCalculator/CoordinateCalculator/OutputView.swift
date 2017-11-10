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
    
    func printMyPoint(myPoint: MyPoint) {
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - myPoint.y, col: (myPoint.x * 2) + 3))\(ANSICode.text.dot)")
    }
    
    func printMyLine(myLine: MyLine) {
        
    }

}
