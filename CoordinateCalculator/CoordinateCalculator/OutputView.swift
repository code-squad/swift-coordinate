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

struct MyLine {
    var pointA = MyPoint(x: 0, y: 0)
    var pointB = MyPoint(x: 0, y: 0)
}

struct OutputView {

    static func drawAxis(line: MyLine) {
        
         print("\(ANSICode.clear)\(ANSICode.home)")
          print("\(ANSICode.cursor.move(row: 24-line.pointA.y+1, col: line.pointA.x*2+3))*")
        
        print("\(ANSICode.cursor.move(row: 24-line.pointB.x+1, col: line.pointB.y*2+3))*")
        
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
        
    }
}
