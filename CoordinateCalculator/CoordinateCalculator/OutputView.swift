//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 27/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {

    static func drawAxis(){
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
    }
    
    static func clear(){
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    static func draw(_ point: MyPoint) {
        clear()
        print("\(ANSICode.cursor.move(row: 24-point.y+1, col: point.x*2+3))*")
        drawAxis()
    }
    
    static func draw(_ line: MyLine) {
        clear()
        print("\(ANSICode.cursor.move(row: 24-line.pointA.y+1, col: line.pointA.x*2+3))*")
        print("\(ANSICode.cursor.move(row: 24-line.pointB.y+1, col: line.pointB.x*2+3))*")
        drawAxis()
        print(line.getValue())
    }
}

