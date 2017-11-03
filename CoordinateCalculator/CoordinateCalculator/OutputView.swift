//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by Mrlee on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    func draw(point: MyPoint) {
        var points = point
        func offsetPoint(){
            points.x = (points.x * 2) + 3
            points.y = (points.y - 25) * -1
        }
        func drawAxis() {
            print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
        }
        offsetPoint()
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.cursor.move(row: points.y, col: points.x))\(ANSICode.text.redBright)\u{00B7}")
        drawAxis()
    }
}
