//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by Mrlee on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    func draw(point: [MyPoint]) {
        var points = point
        print("\(ANSICode.clear)\(ANSICode.home)")
        func offsetPoint() {
            for pointsIndex in 0..<point.count {
                points[pointsIndex].x = (points[pointsIndex].x * 2) + 3
                points[pointsIndex].y = (points[pointsIndex].y - 25) * -1
                print("\(ANSICode.cursor.move(row: points[pointsIndex].y, col: points[pointsIndex].x))\(ANSICode.text.redBright)\u{00B7}")
            }
        }
        
        func drawAxis() {
            print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
        }
        
        offsetPoint()
        drawAxis()
    }
}
