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
            print("\(ANSICode.text.cyanBright)\(ANSICode.cursor.move(row: 28, col: 3)) \(shape.messageByShape())\(shape.calculate())")
            
        case let shape as MyTriangle:
            print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - shape.lineAB.pointA.y, col: (shape.lineAB.pointA.x * 2) + 3))\(ANSICode.text.dot)") //tripointA
            print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - shape.lineAB.pointB.y, col: (shape.lineAB.pointB.x * 2) + 3))\(ANSICode.text.dot)") //tripointB
            print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - shape.lineBC.pointB.y, col: (shape.lineBC.pointB.x * 2) + 3))\(ANSICode.text.dot)") //tripointC
            print("\(ANSICode.text.cyanBright)\(ANSICode.cursor.move(row: 28, col: 3)) \(shape.messageByShape())\(shape.calculate())")
            
        default:
            print("")
            
        }
    }
    
    func drawAxis () {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }

}


