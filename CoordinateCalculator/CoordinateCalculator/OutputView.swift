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
    
    private static func drawPoints(_ points: [MyPoint]) -> String {
        var result = ""
        let drawablePoints = points.map {MyPoint(x: 2*$0.x + 3, y: 25 - $0.y)}
        drawablePoints.forEach {
            result += ANSICode.cursor.move(row: $0.y, col: $0.x)
            result += "•"
        }
        print(result)
        return result
    }
    
    private static func drawValue(of figure: Over1DFigureProtocol) -> String {
        var result = ""
        result += ANSICode.cursor.move(row: 0, col: -2)
        result += "\(figure.descriptionPrefix) \(figure.valueOfFigure)"
        return result
    }
    
    static func drawAxis(with figure: FigureProtocol ) {
        clear()
        print("\(ANSICode.text.redBright)\(drawPoints(figure.points))")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
        drawValue(of: figure)
    }
    
    private static func drawValue(of figure: FigureProtocol) {
        if figure is Over1DFigureProtocol {
            print("\(drawValue(of: figure as! Over1DFigureProtocol))")
        }
    }
}
