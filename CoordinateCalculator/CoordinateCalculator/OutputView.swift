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
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
    }
    
    static func show(point:MyPoint) {
        let x = point.x * 2 + 2
        let y = 25 - point.y
        print("\(ANSICode.cursor.move(row:y, col: x))🙈")
    }
}
