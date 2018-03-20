//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by rhino Q on 2018. 3. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {

    static func clean() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }

    static func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static func drawPoint(at point:(x:Int,y:Int)){
        let x = point.x * 2 + 3
        let y = 25 - point.y
        print("\(ANSICode.cursor.move(row:y, col: x))\(ANSICode.text.redBright)●")
    }
    
    static func printDot(){
        print("\(ANSICode.text.redBright)·")
    }
}
