//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by KIMMINSIK on 2018. 8. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    static func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static func deleteAxis () {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }

    static func drawPoint(_ points: MyPointConvertible ) {
        let coordinateY = abs(points.y - 24)
        let coordinateX = points.x * 2 + 4
        drawAxis()
        print("\(ANSICode.cursor.move(row: coordinateY , col: coordinateX))\(ANSICode.text.redBright).")
        print("\(ANSICode.cursor.move(row: 27, col: 0))")
        deleteAxis()
    }
}
