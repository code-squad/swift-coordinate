//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 김수현 on 2018. 1. 5..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

public struct OutputView {
    
    func drawCoordinates(_ point: MyPoint) {
        clearAxis()
        calculateCoordinates(point)
        drawAxis()
    }
    
    func  calculateCoordinates(_ point: MyPoint) {
        let x = point.x * 2 + 3
        let y = (point.y - 25) * -1
        let p = "●"
        print("\(ANSICode.cursor.move(row: y, col: x))\(ANSICode.text.white)\(p)")
    }
    
    func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    func clearAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
}
