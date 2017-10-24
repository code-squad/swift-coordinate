//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by yangpc on 2017. 10. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    typealias Coordinate = (row: Int, col: Int)
    
    private static func removeText() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    private static func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static func printPoint(_ point: MyPoint) {
        OutputView.removeText()
        let point = calculateCoordinate(point)
        print("\(ANSICode.cursor.move(row: point.row, col: point.col))\(ANSICode.text.whiteBright)⦁")
        OutputView.drawAxis()
        OutputView.removeText()
    }
    
    static func printLine(_ line: MyLine) {
        OutputView.removeText()
        let pointA = calculateCoordinate(line.pointA)
        print("\(ANSICode.cursor.move(row: pointA.row, col: pointA.col))\(ANSICode.text.whiteBright)⦁")
        let pointB = calculateCoordinate(line.pointB)
        print("\(ANSICode.cursor.move(row: pointB.row, col: pointB.col))\(ANSICode.text.whiteBright)⦁")
        OutputView.drawAxis()
        OutputView.removeText()
        OutputView.printDistance(line)
    }
    
    static func printTriangle(_ triangle: MyTriangle) {
        OutputView.removeText()
        let pointA = calculateCoordinate(triangle.lineAB.pointA)
        print("\(ANSICode.cursor.move(row: pointA.row, col: pointA.col))\(ANSICode.text.whiteBright)⦁")
        let pointB = calculateCoordinate(triangle.lineAB.pointB)
        print("\(ANSICode.cursor.move(row: pointB.row, col: pointB.col))\(ANSICode.text.whiteBright)⦁")
        let pointC = calculateCoordinate(triangle.lineBC.pointB)
        print("\(ANSICode.cursor.move(row: pointC.row, col: pointC.col))\(ANSICode.text.whiteBright)⦁")
        OutputView.drawAxis()
        OutputView.removeText()
    }
    
    static func calculateCoordinate(_ point: MyPoint) -> Coordinate {
        let row = abs(24-point.y)+1
        let col = 2*point.x+3
        return (row, col)
    }
    
    private static func printDistance(_ line: MyLine) {
        print("\(ANSICode.clear)")
        print("\(ANSICode.cursor.move(row: 1, col: 1))\(ANSICode.text.whiteBright) 두 점 사이 거리는 \(line.distance())")
    }
}
