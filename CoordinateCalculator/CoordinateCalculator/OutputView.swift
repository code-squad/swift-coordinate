//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by jack on 2017. 12. 8..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    func drawShape (_ userCoordinates : MyShape) {
        if userCoordinates.currentShape == "notRect" {
            clearConsole()
            drawAxis()
            print("입력하신 사각형이 직사각형이 아닙니다. 다시 입력해 주세요")
            return
        }
        let consoleCoordinates = makeConsolePoints(points: userCoordinates.generateCoordinate())
        clearConsole()
        printPoints(points: consoleCoordinates)
        drawAxis()
        printResultOfCalculation(userCoordinates)
    }
    
    private func printResultOfCalculation(_ userShape : MyShape) {
        switch userShape.currentShape {
        case "rect" :
            print("사각형의 넓이는 \(userShape.calculateShape())")
        case "triangle" :
            print("삼각형의 넓이는 \(userShape.calculateShape())")
        case "line":
            print("두 점 사이 의 거리는 \(userShape.calculateShape())")
        default:
            break
        }
    }

    private func printPoints(points : [MyPoint]) {
        for index in 0..<points.count {
        print("\(ANSICode.cursor.move(row : points[index].y , col : points[index].x ))\(ANSICode.text.redBright)●")
        }
    }
    
    private func makeConsolePoints(points : [MyPoint]) -> [MyPoint] {
        var temp : [MyPoint] = []
        for index in 0..<points.count {
            let oneConsolePoint = makeOneConsolePoint(onePoint: points[index])
            temp.append(MyPoint.init(x: oneConsolePoint.x ,y: oneConsolePoint.y))
        }
        return temp
    }
    
    private func makeOneConsolePoint(onePoint : MyPoint) -> (x : Int,y : Int) {
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
