//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by TaeHyeonLee on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    func clearAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    func drawPoint(myPoint: MyPoint) {
        print("\(ANSICode.home)\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: ANSICode.axis.AxisLimit + 1 - myPoint.y, col: myPoint.x * 2 + 3))●")
    }
}

