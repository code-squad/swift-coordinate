//
//  OutView.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/18/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    func drawAxis () {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    func drawPoint (_ point: MyPoint) {
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row:25-point.y, col: point.x*2+3))•\(ANSICode.cursor.move(row:26, col: 0))")
    }
}
