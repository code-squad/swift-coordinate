//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 이진영 on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    static func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static func draw(shape: Drawable) {
        for point in shape.point() {
            drawPoint(point: point)
        }
        
        if let measurableShape = shape as? Measurable {
            print("\(measurableShape.unit.rawValue)\(measurableShape.value)")
        }
    }
    
    private static func drawPoint(point: MyPoint) {
        let row = 25 - point.y
        let col = point.x * 2 + 2
        
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: row, col: col))⌘")
        print("\(ANSICode.cursor.move(row: 27, col: 0))")
    }
}
