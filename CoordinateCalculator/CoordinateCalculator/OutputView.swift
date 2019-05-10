//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by JieunKim on 27/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation



struct MyPoint {
    var x = 0
    var y = 0
}

struct MyLine {
    var pointA = MyPoint(x: 0, y: 0)
    var pointB = MyPoint(x: 0, y: 0)
}



struct OutputView {
    
    static func drawAxis(pointA: [Int], pointB: [Int]) {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.cursor.move(row: 24-pointB[0]+1, col: pointA[0]*2+3))*")
       
           print("\(ANSICode.cursor.move(row: 24-pointA[1]+1, col: pointB[1]*2+3))*")
        
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
        
    }
}

