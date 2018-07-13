//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 1100200 on 2018. 7. 13..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    // * Step 1
    static func drawAxis () {
        print("\(ANSICode.text.cyan)\(ANSICode.axis.draw())")
    }
    
    static func clearAxis () {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    static func initAxis() {
        OutputView.clearAxis()
        OutputView.drawAxis()
    }
    
    // * Step 2
    static func drawPoint (_ input: MyPoint) {
        initAxis()
        print("\(ANSICode.cursor.move(row: input.myPointXY.y, col: input.myPointXY.x))\(ANSICode.text.whiteBright).")
        print("\(ANSICode.cursor.move(row: 26, col: 0))") // to relocate the message
    }
}


