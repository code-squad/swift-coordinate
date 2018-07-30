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
        points.forEach {
            result += ANSICode.cursor.move(row: $0.pointsForDisplay.y, col: $0.pointsForDisplay.x)
            result += "•"
        }
        print(result)
        return result
    }
    
    private static func drawValue(of figure: Over1DFigureProtocol) -> String {
        var result = ""
        result += ANSICode.cursor.move(row: 0, col: -2)
        switch figure {
        case let figure where figure is MyLine:
            result += "두 점 사이의 거리는 \(figure.valueOfFigure)"
        case let figure where figure is MyTriangle:
            result += "삼각형의 넓이는 \(figure.valueOfFigure)"
        default:
            return result
        }
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
