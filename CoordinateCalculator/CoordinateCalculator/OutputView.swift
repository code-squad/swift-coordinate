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
        print("\(ANSICode.cursor.move(row: 24-point[1]+1, col: point[0]*2+3))*")
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
    }
}

