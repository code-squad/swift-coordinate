//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by Elena on 29/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {

    func drawPoint(inputPoints : MyPoint) {
        clearConsole()
        let xPoint = inputPoints.x * 2 + 3
        let yPoint = (inputPoints.y - 25) * -1 
        print("\(ANSICode.cursor.move(row : yPoint, col : xPoint ))\(ANSICode.text.yellowBright)●")
        drawAxis()
    }
    
    private func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    private func clearConsole() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
}
