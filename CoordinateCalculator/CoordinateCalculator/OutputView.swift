//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 2018. 10. 11..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    static private let maxValue = ANSICode.axis.AxisLimit
    
    static func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
    }
    
    static func show(point:MyPoint) {
        let x = point.x * 2 + 2
        let y = maxValue + 1 - point.y
        print("\(ANSICode.cursor.move(row:y, col: x))🙈")
        print("\(ANSICode.cursor.move(row:maxValue + 3, col: 1))")
    }
}
