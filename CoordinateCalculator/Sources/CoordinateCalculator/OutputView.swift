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
    
    static func printFigure(_ axises: [Coordinate]) {
        OutputView.removeText()
        for axis in axises {
            print("\(ANSICode.cursor.move(row: axis.row, col: axis.col))\(ANSICode.text.whiteBright)⦁")
        }
        OutputView.drawAxis()
        OutputView.removeText()
    }
    
    static func printCalculator(_ calculate: (String, Double)) {
        print("\(ANSICode.clear)")
        let title = calculate.0
        let result = calculate.1
        print("\(ANSICode.cursor.move(row: 1, col: 1))\(ANSICode.text.whiteBright) \(title) \(result)")
    }
}

