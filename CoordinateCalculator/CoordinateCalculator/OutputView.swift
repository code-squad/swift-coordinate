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
        
        for point in myPoints {
            print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - point.y, col: (point.x * 2) + 3))\(ANSICode.text.dot)")
        }
        print("\(ANSICode.text.cyanBright)\(ANSICode.cursor.move(row: 28, col: 3)) \(shape.messageByShape())\(shape.calculate())")
    }
    
    func drawAxis () {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
}

