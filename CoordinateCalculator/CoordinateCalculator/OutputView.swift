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
     func printPoints (_ shapes: MyShape) {
        let numericValues = shapes.makeCoordinates()
        deleteAxis()
        drawAxis()
        for numericValue in numericValues {
            print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: numericValue.1, col: numericValue.0 ))\(ANSICode.text.greenBright).")
        }
        print("\(ANSICode.cursor.move(row: 27, col: 0))")
    }
    
    private func drawAxis () {
        print("\(ANSICode.text.cyan)\(ANSICode.axis.draw())")
    }
    
    private func deleteAxis () {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    func printCalculation(myShape: MyShape & ShapeCalculation) {
        let result = myShape.calculate()
        print("\(ANSICode.cursor.move(row: 27, col: 0))\(ANSICode.text.greenBright)\(myShape.resultDescription)\(result)")
    }

}


