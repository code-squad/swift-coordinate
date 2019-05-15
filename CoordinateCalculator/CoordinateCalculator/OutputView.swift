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
        print("\(ANSICode.cursor.move(row: 24-point.y+1, col: point.x*2+3))*")
    }
    
    static func drawPoint(_ point: MyPoint) {
        clear()
        draw(point)
        drawAxis()
    }
    
    static func drawLine(_ line: MyLine) {
        clear()
        draw(line.pointA)
        draw(line.pointB)
        drawAxis()
        print("두 점 사이의 거리는 \(line.getValue())")
    }
}

