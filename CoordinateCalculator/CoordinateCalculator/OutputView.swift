//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by rhino Q on 2018. 3. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {

    static func clean() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }

    static func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }

    static func drawPoint(at points:[MyPoint]) {
        for index in 0..<points.count{
            print("\(ANSICode.cursor.move(row:points[index].yOfCoordinates, col: points[index].xOfCorrdinates))\(ANSICode.text.redBright)●")
        }
    }
    
}
