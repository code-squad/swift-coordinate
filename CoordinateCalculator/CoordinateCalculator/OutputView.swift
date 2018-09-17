//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by KIMMINSIK on 2018. 8. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    static func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static func deleteAxis () {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    static func drawPoint(_ points: MyPointConvertible ) {
        let coordinates = points.convertMyPoint()
        drawAxis()
        for coordinate in coordinates {
            print("\(ANSICode.cursor.move(row:abs(coordinate.y - 24) , col: coordinate.x * 2 + 4 ))\(ANSICode.text.redBright).")
        }
        deleteAxis()
    }
    
    func printAxisExplanation(myProtocol: MyPointConvertible & FigureCalculation ) {
        let explanation = myProtocol.calculate()
        print("\(ANSICode.cursor.move(row: 30, col: -1))\(ANSICode.text.yellow)\(myProtocol.description)\(explanation)")
    }
}
