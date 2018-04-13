//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by moon on 2018. 3. 30..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    private let marker: String = "☀︎"
    private let originPointOfAxis = MyPoint(x: 3, y: ANSICode.axis.AxisLimit + 1)
    
    private let figure: Figure
    
    init(_ figure: Figure) {
        self.figure = figure
    }
    
    func drawFigure() {
        for myPoint in self.figure.myPoints {
            drawPoint(myPoint)
        }
    }
    
    private func drawPoint(_ point: MyPoint) {
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: originPointOfAxis.y - point.y , col: originPointOfAxis.x + point.x * 2))\(marker)")
    }
    
    static func drawAxis() {
        print("\(ANSICode.text.cyanBright)\(ANSICode.axis.draw())")
    }
    
    static func printDistance(_ figure: FigureCalculatable & DistancePrintable) {
        print(figure.prefixText, figure.calculateDistance())
    }
}
