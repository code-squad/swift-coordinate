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
        shape.printPoints()
        print("\(ANSICode.text.cyanBright)\(ANSICode.cursor.move(row: 28, col: 3)) \(shape.messageByShape())\(shape.calculate())")
    }
    
    func drawAxis () {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }

}


