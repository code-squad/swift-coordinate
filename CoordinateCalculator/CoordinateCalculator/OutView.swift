//
//  OutView.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/18/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    func drawAxis () {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    func drawPoint (_ point: MyPoint) {
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row:25-point.y, col: point.x*2+3))•\(ANSICode.cursor.move(row:26, col: 0))")
    }
    func drawLine (_ line: MyLine) {
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row:25-line.pointA.y, col: line.pointA.x*2+3))•\(ANSICode.cursor.move(row:25-line.pointB.y, col: line.pointB.x*2+3))•\(ANSICode.cursor.move(row:26, col: 0))")
        printLength(line)
        
//        print(제곱근((A.x - B.x)^제곱 + (A.y - B.y)^제곱)
    }
    func printLength(_ line: MyLine) {
        let legA = pow(Double(line.pointA.x - line.pointB.x), 2)
        let legB = pow(Double(line.pointA.y - line.pointB.y), 2)
        let length = sqrt(legA + legB)
        
        print("두 점 사이의 거리는  \(length)")
    }
    
}
