//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 16..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView{
    
    func drawClear () {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    func drawPoint (_ shape: MyShape) {
        let myPoints = shape.getMyPoints()
        if shape is MyPoint {
            printPoints(myPoints)
        } else {
            printPoints(myPoints)
            printResultMessage(forShape: shape as! MyShape & ResultByShape)
        }
    }
    
    func drawAxis () {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
}


extension OutputView {

    private func printPoints (_ points: [(Int, Int)]) {
        for point in points {
            print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - point.1, col: (point.0 * 2) + 3))\(ANSICode.text.dot)")
        }
    }
    
    private func printResultMessage (forShape result: MyShape & ResultByShape) {
        print("\(ANSICode.text.cyanBright)\(ANSICode.cursor.move(row: 28, col: 3)) \(result.messageByShape())\(result.calculate())")
    }

}

