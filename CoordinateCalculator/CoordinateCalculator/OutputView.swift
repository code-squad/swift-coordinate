//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by cushy k on 17/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {

    /**
    draw a Axix.
    */
    private static func drawAxis() {
        formatScreen()
        let quadrantOne = ANSICode.axis.draw()
        print("\(ANSICode.text.whiteBright)\(quadrantOne)")
    }

    /**
     clear a screen
    */
    private static func formatScreen() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }

    /**
     mark a sign at axix.

     - parameters:
         - point: MyPoint
    */
    static func mark(at point: MyPoint) {
        print(point)
        let standardRow = 2 * point.positionX
        let axisBound = ANSICode.axis.AxisLimit + 1
        let sign = "📌"
        drawAxis()
        print("\(ANSICode.cursor.move(row: axisBound - point.positionY, col: standardRow + 3))\(sign)")
        // for showing full axis. If not, broken screen.
        print("\(ANSICode.cursor.move(row: axisBound + 3, col: axisBound + 3))")

    }

    static func printError(message: InputError) {
        print(message)
    }
}
