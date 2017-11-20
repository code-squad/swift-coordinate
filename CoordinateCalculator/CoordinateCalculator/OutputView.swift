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
    
    func drawPoint (_ point: MyPointOutput) {
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: point.y, col: point.x))\(ANSICode.text.dot)")
    }
    
    func drawAxis () {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
}
