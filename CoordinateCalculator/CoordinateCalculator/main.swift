//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

var isCorrectInputValue = false
var myShape: MyShape? = nil
repeat {
    let inputView = InputView()
    let inputValue = inputView.readInput()
    do {
        try myShape = inputView.checkCountOfInputValue(inputValue: inputValue)
        isCorrectInputValue = true
    } catch CoordinateError.inputValuesOfLineError {
        print("두 개의 입력값 형식 에러")
    }
} while(!isCorrectInputValue)

var outputView = OutputView()
outputView.drawClear()
if myShape?.type == Figure.point {
    outputView.printMyPoint(myPoint: myShape as! MyPoint )
} else {
    outputView.printMyLine(myLine: myShape as! MyLine)
    outputView.printValueOfResult(myShape: myShape as! MyLine)
}
outputView.drawAxis()

