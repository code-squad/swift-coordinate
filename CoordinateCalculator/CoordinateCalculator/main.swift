//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

var isNotCorrectInputValue = true
var myShape: MyShape
var myPoint: MyShape
repeat {
    let inputView = InputView()
    let inputValue = inputView.readInput()
    do {
        try myPoint = inputView.checkCountOfInputValue(inputValue: inputValue) as! MyPoint
        isNotCorrectInputValue = false
    } catch CoordinateError.inputValuesOfLineError {
        print("두 개의 입력값 형식 에러")
    }
} while(isNotCorrectInputValue)

var outputView = OutputView()
outputView.drawClear()
outputView.printMyPoint(myPoint: myPoint as! MyPoint)
outputView.drawAxis()
