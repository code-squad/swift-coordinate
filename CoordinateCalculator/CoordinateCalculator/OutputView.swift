//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by CHOMINJI on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    var point: MyPoint
    
    func drawPoint() {
        let translatedPoint = translatePointPosition(of: point)
        var result = ANSICode.cursor.move(row: translatedPoint.y, col: translatedPoint.x)
        result += ANSICode.text.redBright
        result += "µ"

        print(result)
    }
    func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
}

