//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 23/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    static func clear() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    static func makeDrawablePoint(_ point: MyPoint) -> String {
        var result = ""
        result += ANSICode.cursor.move(row: point.y, col: point.x)
        result += "•"
        return result
    }
    
    static func drawAxis(with point: MyPoint) {
        clear()
        print("\(ANSICode.text.redBright)\(makeDrawablePoint(point))")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
}
