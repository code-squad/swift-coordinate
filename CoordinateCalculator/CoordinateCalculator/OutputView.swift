//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 2018. 10. 11..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    static func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
    }
    
    static func show(point:(Int,Int)) {
        print("\(ANSICode.cursor.move(row:point.1, col:point.0))🙈")
        print("\(ANSICode.cursor.move(row:ANSICode.axis.AxisLimit + 3, col: 1))")
    }
    
}
