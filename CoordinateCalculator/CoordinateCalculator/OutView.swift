//
//  OutView.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/18/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    func drawAxis () {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    func drawFigure (_ figure: Figure) {
        print("\(ANSICode.text.yellowBright)")
        let points = figure.draw()
        for (x, y) in points {
            print("\(ANSICode.cursor.move(row:25-y, col: x*2+3))•")
        }
        print("\(ANSICode.cursor.move(row:26, col: 0))")
    }
    func printMent (_ figure: Figure) {
        print("\(ANSICode.text.whiteBright)")
        print(figure.ment())
    }
}
