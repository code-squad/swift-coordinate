//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 23/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    static func clear() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    private static func drawPoints(_ points: [Point]) -> String {
        var result = ""
        points.forEach {
            result += ANSICode.cursor.move(row: $0.x, col: $0.y)
            result += "•"
        }
        print(result)
        return result
    }
    
    private static func displayShapeValue(_ shape: Over2DFigureProtocol) -> String {
        var result = ""
        result += ANSICode.cursor.move(row: 0, col: -2)
        result += "두 점 사이의 거리는 \(shape.valudOfFigure)"
        return result
    }
    
    static func drawAxis(with figure: FigureProtocol ) {
        clear()
        print("\(ANSICode.text.redBright)\(drawPoints(figure.pointsForDisplay))")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
        
        if figure is Over2DFigureProtocol {
            let valuableFigure = figure as! Over2DFigureProtocol
            print("\(displayShapeValue(valuableFigure))")
        }
    }
}
