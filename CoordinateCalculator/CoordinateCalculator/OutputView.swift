//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by Eunjin Kim on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    enum Figure {
        case point
        case line
        case triangle
    }
    
    func drawClear() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    func printMyShape(myShape: MyShape?) {
        let myPoint = myShape?.calculateOfPosition() ?? [MyPoint(x: 0, y: 0)]
        for point in myPoint {
            print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - point.y, col: (point.x * 2) + 3))\(ANSICode.text.dot)")
        }
        
        let result = myShape?.resultOfMyShape()
        print("\(ANSICode.cursor.move(row: 30, col: -1))\(ANSICode.text.black)\(myShape?.resultDescription ?? "")\(result ?? 0)")
    }
    
}
