//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by Choi Jeong Hoon on 2017. 11. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    // MyShape객체를 받아 해당 객체의 타입을 분류하여 타입에 맞는 케이스를 출력하는 함수
    func printShape (_ shapes: MyShape) {
        let myShapes = shapes.makeCoordinates()
        deleteAxis ()
        drawAxis ()
        switch shapes {
        case  is MyPoint :
            printPoints(myShapes)
        default :
            printPoints(myShapes)
            printCalculation(myLine: shapes as! MyShape & ShapeCalculation)
        }
        print("\(ANSICode.cursor.move(row: 27, col: 0))")
    }
    
    // 점을 출력하는 함수
    func printPoints (_ numericValues: [(Int, Int)]) {
        for numericValue in numericValues {
            print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: numericValue.1, col: numericValue.0 ))\(ANSICode.text.greenBright).")
        }
    }
    
    // 도형의 연산내용을 출력하는 함수
    private func printCalculation(myLine: MyShape & ShapeCalculation) {
        print("\(ANSICode.cursor.move(row: 27, col: 0))\(ANSICode.text.greenBright)\(myLine.resultDescription)\(myLine.calculate())")
    }
    
    private func drawAxis () {
        print("\(ANSICode.text.cyan)\(ANSICode.axis.draw())")
    }
    
    private func deleteAxis () {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
}
