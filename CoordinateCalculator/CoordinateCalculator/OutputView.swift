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
        switch userCoordinates.generateCoordinate().count {
        case 3 :
            drawTriangle(inputTriangle: userCoordinates.generateCoordinate())
            print("삼각형의 넓이는 \(userCoordinates.calculateShape())")
        case 2:
            drawLine(inputLine: userCoordinates.generateCoordinate())
            print("두 점 사이 의 거리는 \(userCoordinates.calculateShape())")
        default:
            drawPoint(inputPoints: userCoordinates.generateCoordinate())
        }
    }   
    
    private func drawPoint(inputPoints : [MyPoint]) {
        let consoleCoordinate = makeConsolePoint(onePoint: inputPoints[0])
        clearConsole()
        print("\(ANSICode.cursor.move(row : consoleCoordinate.y, col : consoleCoordinate.x ))\(ANSICode.text.redBright)●")
        drawAxis()
    }
    
    private func drawLine(inputLine : [MyPoint]) {
        let firstCoordinate = makeConsolePoint(onePoint: inputLine[0])
        let secondCoordinate = makeConsolePoint(onePoint: inputLine[1])
        clearConsole()
        print("\(ANSICode.cursor.move(row : firstCoordinate.y, col : firstCoordinate.x ))\(ANSICode.text.redBright)●")
        print("\(ANSICode.cursor.move(row : secondCoordinate.y, col : secondCoordinate.x ))\(ANSICode.text.redBright)●")
        drawAxis()
    }
    
    private func drawTriangle(inputTriangle : [MyPoint]) {
        let firstCoordinate = makeConsolePoint(onePoint: inputTriangle[0])
        let secondCoordinate = makeConsolePoint(onePoint: inputTriangle[1])
        let thirdCoordinate = makeConsolePoint(onePoint: inputTriangle[2])
        clearConsole()
        print("\(ANSICode.cursor.move(row : firstCoordinate.y, col : firstCoordinate.x ))\(ANSICode.text.redBright)●")
        print("\(ANSICode.cursor.move(row : secondCoordinate.y, col : secondCoordinate.x ))\(ANSICode.text.redBright)●")
        print("\(ANSICode.cursor.move(row : thirdCoordinate.y, col : thirdCoordinate.x ))\(ANSICode.text.redBright)●")
        drawAxis()
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
