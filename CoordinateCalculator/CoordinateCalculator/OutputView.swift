//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by jack on 2017. 12. 8..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    func printShape (_ userCoordinates : MyShape) {
        switch userCoordinates.currentShape {
        case "line":
            drawLine(inputLine: userCoordinates.line)
        default:
            drawPoint(inputPoints: userCoordinates.point)
        }
    }
    
    private func drawPoint(inputPoints : MyPoint) {
        let consoleCoordinate = makeConsolePoint(onePoint: inputPoints)
        clearConsole()
        print("\(ANSICode.cursor.move(row : consoleCoordinate.y, col : consoleCoordinate.x ))\(ANSICode.text.redBright)●")
        drawAxis()
    }
    
    private func drawLine(inputLine : MyLine) {
        let firstCoordinate = makeConsolePoint(onePoint: inputLine.pointA)
        let secondCoordinate = makeConsolePoint(onePoint: inputLine.pointB)
        clearConsole()
        print("\(ANSICode.cursor.move(row : firstCoordinate.y, col : firstCoordinate.x ))\(ANSICode.text.redBright)●")
        print("\(ANSICode.cursor.move(row : secondCoordinate.y, col : secondCoordinate.x ))\(ANSICode.text.redBright)●")
        drawAxis()
        let distance = inputLine.calculateDistance()
        print("두 점 사이의 거리는 \(distance)")
    }
    
    private func makeConsolePoint(onePoint : MyPoint) -> (x : Int,y : Int) {
        let consoleXpoint = onePoint.x * 2 + 3
        let consoleYpoint = (onePoint.y - 25) * -1
        return (consoleXpoint, consoleYpoint)
    }
    
    private func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    private func clearConsole() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
}
