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
        print("\(ANSICode.cursor.move(row : yPoint, col : xPoint ))\(ANSICode.text.redBright)●")
        drawAxis()
    }
    
    func drawLine(inputLine : MyLine) {
        clearConsole()
        let firstXpoint = inputLine.pointA.x * 2 + 3
        let firstYpoint = (inputLine.pointA.y - 25) * -1
        let secondXpoint = inputLine.pointB.x * 2 + 3
        let secondYpoint = (inputLine.pointB.y - 25) * -1
        print("\(ANSICode.cursor.move(row : firstYpoint, col : firstXpoint ))\(ANSICode.text.redBright)●")
        print("\(ANSICode.cursor.move(row : secondYpoint, col : secondXpoint ))\(ANSICode.text.redBright)●")
        drawAxis()
        let distance = inputLine.calculateDistance()
        print("두 점 사이의 거리는 \(distance)")

    }
    
    private func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    private func clearConsole() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
}
