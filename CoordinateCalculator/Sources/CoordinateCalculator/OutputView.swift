//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by yuaming on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    private static func clearAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    private static func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static func moveCoordinates(in points: [MyPoint]) throws {
        guard let figure = Figure().getFigureModel(in: points) else {
            throw InputViewError.emptyValue
        }
        
        printCoordinates(in: figure)
        printResultToCalculate(in: figure)
    }
    
    private static func printCoordinates(in figure: Figurable) {
        clearAxis()
        
        for point in figure.getPoints {
            drawCoordinate(calculateCoordiantesToDraw(point))
        }
        
        drawAxis()
    }
    
    private static func printResultToCalculate(in figure: Figurable) {
        switch figure.getPoints.count {
        case 2:
            print("\(ANSICode.text.whiteBright)두 점 사이의 거리는 \(figure.calculate())")
        default:
            print("")
        }
    }
    
    private static func drawCoordinate(_ coordinatesToDraw: (x: Int, y: Int)) {
        print("\(ANSICode.cursor.move(row: coordinatesToDraw.y, col: coordinatesToDraw.x)).")
    }
    
    private static func calculateCoordiantesToDraw(_ point: MyPoint) -> (Int, Int){
        return (point.x * 2 + 3, abs(point.y - 24) + 1)
    }
}
