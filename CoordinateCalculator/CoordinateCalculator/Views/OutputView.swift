//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 8..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    static private func clear() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    static private func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static private func draw(_ point: MyPoint) {
        print("\(ANSICode.cursor.move(row: ANSICode.axis.AxisLimit - point.y + 1, col: point.x * 2 + 3))•\(ANSICode.cursor.move(row: ANSICode.axis.AxisLimit + 2, col: 0))", terminator: "")
    }
    
    static func draw(_ shape: Shape) {
        clear()
        for point in shape.points {
            draw(point)
        }
        drawAxis()
        if let shape = shape as? Measurable {
            print("\(shape.areaDescription()) \(shape.area)")
        }
    }
}
