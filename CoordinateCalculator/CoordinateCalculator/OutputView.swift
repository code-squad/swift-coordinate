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
        let pointCoordinate = calculateCoordinates(point)
        clearAxis()
        print("\(ANSICode.cursor.move(row: pointCoordinate.y, col: pointCoordinate.x))\(ANSICode.text.white)●")
        drawAxis()
    }
    
    func drawLine(_ line: MyLine) {
        let firstCoordinate = calculateCoordinates(line.pointA)
        let secondCoordinate = calculateCoordinates(line.pointB)
        clearAxis()
        print("\(ANSICode.cursor.move(row: firstCoordinate.y, col: firstCoordinate.x))\(ANSICode.text.white)●")
        print("\(ANSICode.cursor.move(row: secondCoordinate.y, col: secondCoordinate.x))\(ANSICode.text.white)●")
        drawAxis()
        let distance = line.calculateDistance()
        print("두 점 사이의 거리는 \(distance)")
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


