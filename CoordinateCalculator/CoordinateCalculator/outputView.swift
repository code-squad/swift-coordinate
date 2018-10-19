//
//  outputView.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 2018. 10. 16..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    private var point: MyPoint
    
    init(point: MyPoint) {
        self.point = point
    }
    
    public func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.axis.draw())\(ANSICode.text.whiteBright)")
    }
    
    public func markPoint() {
        print("\(ANSICode.cursor.move(row: 25 - point.y, col: 2 * point.x + 3))\(ANSICode.text.yellowBright)*")
        print("\(ANSICode.cursor.move(row: 26, col: 0))")
    }
}
