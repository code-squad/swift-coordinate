//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by yuaming on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    enum Errors: String, Error {
        case emptyValue = "입력값이 없습니다."
        case notCalculatedValue = "계산 결과값이 없습니다."
        case notRectagle = "직사각형이 아닙니다."
    }
    
    private static func clearAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    private static func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static func moveCoordinates(in points: [MyPoint]) throws {
        guard let figure = try Figure().getFigureModel(in: points) else {
            throw OutputView.Errors.emptyValue
        }
        
        if figure.points.count > 1 {
            guard figure.calculate() > 0 else {
                throw OutputView.Errors.notCalculatedValue
            }
        }
        
        printCoordinates(in: figure)
        printResultToCalculate(in: figure)
    }
    
    private static func printCoordinates(in figure: Figurable) {
        clearAxis()
        
        for point in figure.points {
            drawCoordinate(calculateCoordiantesToDraw(point))
        }
        
        drawAxis()
    }
    
    private static func printResultToCalculate(in figure: Figurable) {
        print("\(ANSICode.text.whiteBright)\(figure.messageToCalculate())\(figure.calculate())")
    }
    
    private static func drawCoordinate(_ coordinatesToDraw: (x: Int, y: Int)) {
        print("\(ANSICode.cursor.move(row: coordinatesToDraw.y, col: coordinatesToDraw.x)).")
    }
    
    private static func calculateCoordiantesToDraw(_ point: MyPoint) -> (Int, Int){
        return (point.x * 2 + 3, abs(point.y - 24) + 1)
    }
}
