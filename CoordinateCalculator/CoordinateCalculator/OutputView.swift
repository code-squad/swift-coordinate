//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 27/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    var x = 0
    var y = 0
}


struct OutputView {
    
    static func drawAxis(point: [Int]) {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.cursor.move(row:point[0], col: point[1]))*")
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
    }
}

