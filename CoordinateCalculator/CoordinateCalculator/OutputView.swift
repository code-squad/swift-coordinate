//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 김수현 on 2018. 1. 5..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

public struct OutputView {
    
    func drawCoordinates(_ myShape: MyShape) {
        clearAxis()
        let point = myShape.drawPoint()
        for index in 0..<point.count {
            let pointCoordinate = calculateCoordinates(point[index])
            print("\(ANSICode.cursor.move(row: pointCoordinate.y, col: pointCoordinate.x))\(ANSICode.text.white)●")
        }
        drawAxis()
    }
    
    func calculateShape(_ myCalculate: MyCalculate) {
        let value = myCalculate.calculate()
        print(value.0, value.1)
    }
    
    func  calculateCoordinates(_ point: MyPoint) -> (x: Int, y: Int) {
        let x = point.x * 2 + 3
        let y = (point.y - 25) * -1
        return (x, y)
    }
    
    func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    func clearAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
}


