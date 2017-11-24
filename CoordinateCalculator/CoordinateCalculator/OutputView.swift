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
        switch shape {
        case let shape as MyPoint:
            print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - shape.y, col: (shape.x * 2) + 3))\(ANSICode.text.dot)")
        case let shape as MyLine:
            print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - shape.pointA.y, col: (shape.pointA.x * 2) + 3))\(ANSICode.text.dot)")
            print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - shape.pointB.y, col: (shape.pointB.x * 2) + 3))\(ANSICode.text.dot)")
        default:
            print("")
        }
        print("두 점 사이의 거리는  \(shape.calculate())")
    }
    
    func drawAxis () {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }

}
