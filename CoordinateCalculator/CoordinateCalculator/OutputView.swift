//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by jack on 2017. 12. 8..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    func drawPoint(inputPoints : MyPoint) {
        clearConsole()
        let xPoint = inputPoints.x * 2 + 3
        let yPoint = (inputPoints.y - 25) * -1
        print("\(ANSICode.cursor.move(row : yPoint, col : xPoint ))\(ANSICode.text.redBright)*")
        drawAxis()
    }
    
    func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    func clearConsole() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
}
