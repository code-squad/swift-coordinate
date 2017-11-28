//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by Choi Jeong Hoon on 2017. 11. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    func printShape (_ input: MyShape) {
        deleteAxis()
        drawAxis()
        switch input {
        case  let point as MyPoint :
            drawPoint(myPoint: point)
        case let line as MyLine :
            drawLine(myLine: line)
            printDistancesBetweenPoints(myLine: input as! MyLine)
        default :
            print (SyntaxChecker.ErrorMessage.ofUnKnownError.rawValue)
        }
        print("\(ANSICode.cursor.move(row: 27, col: 0))")
    }
    
    private func drawPoint(myPoint: MyPoint) {
        print("\(ANSICode.cursor.move(row: myPoint.y , col: myPoint.x))\(ANSICode.text.greenBright).")
    }
    private func drawLine(myLine: MyLine) {
        print("\(ANSICode.cursor.move(row: myLine.pointA.y, col: myLine.pointA.x))\(ANSICode.text.greenBright).\(ANSICode.cursor.move(row: myLine.pointB.y, col: myLine.pointB.x))\(ANSICode.text.greenBright).")
    }
    
    private func printDistancesBetweenPoints(myLine: MyLine) {
        print("\(ANSICode.cursor.move(row: 27, col: 0))\(ANSICode.text.greenBright)두점 사이의 거리는 \(myLine.calculateOfLength()) 입니다.")
    }
    
    private func drawAxis () {
        print("\(ANSICode.text.cyan)\(ANSICode.axis.draw())")
    }
    
    private func deleteAxis () {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
}
