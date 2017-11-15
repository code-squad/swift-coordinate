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
    } catch InputView.CoordinateError.inputValuesOfLine {
        print("두 개의 입력값 형식 에러")
    }
} while !isCorrectInputValue

var outputView = OutputView()
outputView.drawClear()
outputView.printMyShape(myShape: myShape)
outputView.drawAxis()

if let myDescription = myShape as? (MyDescription & MyShape) {
    outputView.printMyDescription(myShape: myDescription)
}

