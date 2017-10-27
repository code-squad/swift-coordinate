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
    
    private static func convertCoordinateOnAxis(_ points: [MyPoint]) -> [Coordinate] {
        var coordinates = [Coordinate]()
        for point in points {
            let row = abs(24-point.y)+1
            let col = 2*point.x+3
            coordinates.append((row, col))
        }
        return coordinates
    }
    
    static func printFigure(_ figure: Figure) {
        OutputView.removeText()
        let points = figure.points
        let coordinates = OutputView.convertCoordinateOnAxis(points)
        for coordinate in coordinates {
            print("\(ANSICode.cursor.move(row: coordinate.row, col: coordinate.col))\(ANSICode.text.whiteBright)⦁")
        }
        OutputView.drawAxis()
        OutputView.removeText()
        printCalculator(figure)
    }
    
    private static func printCalculator(_ figure: Figure) {
        print("\(ANSICode.clear)")
        let numberOfPoints = figure.points.count
        switch numberOfPoints {
        case 2:
            let line = figure as? MyLine
            print("\(ANSICode.cursor.move(row: 1, col: 1))\(ANSICode.text.whiteBright) 두 점 사이 거리는 \(line?.distance() ?? 0)")
        case 3:
            let triangle = figure as? MyTriangle
            print("\(ANSICode.cursor.move(row: 1, col: 1))\(ANSICode.text.whiteBright) 삼각형 넓이는 \(triangle?.area() ?? 0)")
        case 4:
            let rect = figure as? MyRect
            print("\(ANSICode.cursor.move(row: 1, col: 1))\(ANSICode.text.whiteBright) 사각형 넓이는 \(rect?.area() ?? 0)")
        default: break
        }
        
    }
    
}
