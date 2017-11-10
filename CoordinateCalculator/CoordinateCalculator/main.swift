//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

var isNotCorrectInputValue = true
var myShape: MyShape? = nil
repeat {
    let inputView = InputView()
    let inputValue = inputView.readInput()
    do {
        try myShape = inputView.checkCountOfInputValue(inputValue: inputValue) as! MyPoint
        isNotCorrectInputValue = false
    } catch CoordinateError.inputValuesOfLineError {
        print("두 개의 입력값 형식 에러")
    }
} while(isNotCorrectInputValue)

var outputView = OutputView()
outputView.drawClear()
if myShape?.type == Figure.point {
    outputView.printMyPoint(myPoint: myShape as! MyPoint )
} else {
    outputView.printMyLine(myLine: myShape as! MyLine)
}
outputView.drawAxis()
