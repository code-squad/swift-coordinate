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


public struct OutputView {
    static func drawAxis(){
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
        print("\(ANSICode.cursor.move(row:10, col: 10))*")
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
    }
}



