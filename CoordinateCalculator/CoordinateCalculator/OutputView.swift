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
        case "triangle" :
            drawTriangle(inputTriangle: userCoordinates)
        case "line":
            drawLine(inputLine: userCoordinates)
        default:
            drawPoint(inputPoints: userCoordinates)
        }
    }   
    
    private func drawPoint(inputPoints : MyShape) {
        let consoleCoordinate = makeConsolePoint(onePoint: inputPoints.generateCoordinate()[0])
        clearConsole()
        print("\(ANSICode.cursor.move(row : consoleCoordinate.y, col : consoleCoordinate.x ))\(ANSICode.text.redBright)●")
        drawAxis()
    }
    
    private func drawLine(inputLine : MyShape) {
        let firstCoordinate = makeConsolePoint(onePoint: inputLine.generateCoordinate()[0])
        let secondCoordinate = makeConsolePoint(onePoint: inputLine.generateCoordinate()[1])
        clearConsole()
        print("\(ANSICode.cursor.move(row : firstCoordinate.y, col : firstCoordinate.x ))\(ANSICode.text.redBright)●")
        print("\(ANSICode.cursor.move(row : secondCoordinate.y, col : secondCoordinate.x ))\(ANSICode.text.redBright)●")
        drawAxis()
        print("두 점 사이 의 거리는 \(inputLine.calculateShape())")
    }
    
    private func drawTriangle(inputTriangle : MyShape) {
        let firstCoordinate = makeConsolePoint(onePoint: inputTriangle.generateCoordinate()[0])
        let secondCoordinate = makeConsolePoint(onePoint: inputTriangle.generateCoordinate()[1])
        let thirdCoordinate = makeConsolePoint(onePoint: inputTriangle.generateCoordinate()[2])
        clearConsole()
        print("\(ANSICode.cursor.move(row : firstCoordinate.y, col : firstCoordinate.x ))\(ANSICode.text.redBright)●")
        print("\(ANSICode.cursor.move(row : secondCoordinate.y, col : secondCoordinate.x ))\(ANSICode.text.redBright)●")
        print("\(ANSICode.cursor.move(row : thirdCoordinate.y, col : thirdCoordinate.x ))\(ANSICode.text.redBright)●")
        drawAxis()
        print("삼각형의 넓이는 \(inputTriangle.calculateShape())")
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
