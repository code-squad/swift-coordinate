//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by yuaming on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    static func clearAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    static func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static func moveCoordinate(_ myPoint: MyPoint) {
        drawCoordinates(myPoint.calculateCoordinatesToDraw())
    }
    
    private static func drawCoordinates(_ coordinatesToDraw: MyPoint) {
        clearAxis()
        print("\(ANSICode.cursor.move(row: coordinatesToDraw.y, col: coordinatesToDraw.x)).")
        drawAxis()
    }
}
