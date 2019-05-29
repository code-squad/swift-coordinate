//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by JH on 09/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    static func draw(shape: DrawableShape) {
        for point in shape.drawablePoints() {
            draw(point: point)
        }
        
        if let line = shape as? MyLine {
            OutputView.printDistance(line: line)
        }
        
        if let triangle = shape as? MyTriangle {
            OutputView.printTriangleArea(triangle: triangle)
        }
    }

    static func drawAxis(){
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
    }
    
    private static func draw(point: MyPoint) {
        
        let startPoint = ANSICode.axis.AxisLimit + 1
        let x = point.x
        let y = point.y

        print("\(ANSICode.cursor.move(row: startPoint-y, col: (x*2)+2))😆\(ANSICode.cursor.move(row: startPoint+1, col: (startPoint*2)+2))")
    }
    
    private static func printDistance(line: MyLine) {
        print("두 점 사이 거리는 \(line.distance())")
    }
    
    static func printTriangleArea(triangle: MyTriangle) {
        print("삼각형 넓이는 \(triangle.calcurateTriangle())")
    }
    
}
