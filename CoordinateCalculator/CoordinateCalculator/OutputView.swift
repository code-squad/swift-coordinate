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
    
    static func prints(point: MyPoint) {
        OutputView.removeText()
        let point = calculateCoordinate(point)
        print("\(ANSICode.cursor.move(row: point.row, col: point.col))\(ANSICode.text.whiteBright)⦁")
        OutputView.drawAxis()
        OutputView.removeText()
    }
    
    static func prints(line: MyLine) {
        OutputView.removeText()
        let pointA = calculateCoordinate(line.pointA)
        print("\(ANSICode.cursor.move(row: pointA.row, col: pointA.col))\(ANSICode.text.whiteBright)⦁")
        let pointB = calculateCoordinate(line.pointB)
        print("\(ANSICode.cursor.move(row: pointB.row, col: pointB.col))\(ANSICode.text.whiteBright)⦁")
        OutputView.drawAxis()
        OutputView.removeText()
        OutputView.printDistance(line)
    }
    
    static func prints(triangle: MyTriangle) {
        OutputView.removeText()
        let pointA = calculateCoordinate(triangle.lineAB.pointA)
        print("\(ANSICode.cursor.move(row: pointA.row, col: pointA.col))\(ANSICode.text.whiteBright)⦁")
        let pointB = calculateCoordinate(triangle.lineAB.pointB)
        print("\(ANSICode.cursor.move(row: pointB.row, col: pointB.col))\(ANSICode.text.whiteBright)⦁")
        let pointC = calculateCoordinate(triangle.lineBC.pointB)
        print("\(ANSICode.cursor.move(row: pointC.row, col: pointC.col))\(ANSICode.text.whiteBright)⦁")
        OutputView.drawAxis()
        OutputView.removeText()
        printArea(triangle: triangle)
    }
    
    static func prints(rect: MyRect) {
        OutputView.removeText()
        let pointA = calculateCoordinate(rect.leftTop)
        print("\(ANSICode.cursor.move(row: pointA.row, col: pointA.col))\(ANSICode.text.whiteBright)⦁")
        let pointB = calculateCoordinate(MyPoint(x: rect.leftTop.x, y: rect.rightBottom.y) )
        print("\(ANSICode.cursor.move(row: pointB.row, col: pointB.col))\(ANSICode.text.whiteBright)⦁")
        let pointC = calculateCoordinate(rect.rightBottom)
        print("\(ANSICode.cursor.move(row: pointC.row, col: pointC.col))\(ANSICode.text.whiteBright)⦁")
        let pointD = calculateCoordinate(MyPoint(x: rect.rightBottom.x, y: rect.leftTop.y))
        print("\(ANSICode.cursor.move(row: pointD.row, col: pointD.col))\(ANSICode.text.whiteBright)⦁")
        OutputView.drawAxis()
        OutputView.removeText()
        printArea(rect: rect)
    }

    
    static func calculateCoordinate(_ point: MyPoint) -> Coordinate {
        let row = Int( abs(24-point.y)+1 )
        let col = Int( 2*point.x+3 )
        return (row, col)
    }
    
    private static func printDistance(_ line: MyLine) {
        print("\(ANSICode.clear)")
        print("\(ANSICode.cursor.move(row: 2, col: 1))\(ANSICode.text.whiteBright) 두 점 사이 거리는 \(line.distance())")
    }
    
    private static func printArea(triangle: MyTriangle) {
        print("\(ANSICode.clear)")
        print("\(ANSICode.cursor.move(row: 2, col: 1))\(ANSICode.text.whiteBright) 삼각형 넓이는  \(triangle.areaTriangle())")
    }
    
    private static func printArea(rect: MyRect) {
        print("\(ANSICode.clear)")
        print("\(ANSICode.cursor.move(row: 2, col: 1))\(ANSICode.text.whiteBright) 사각형 넓이는  \(rect.areaRect())")
    }
}
