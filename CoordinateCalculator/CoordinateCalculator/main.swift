//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

var isNotCorrectInputValue = true
var myPoint = MyPoint(x: 0,y: 0)
repeat {
    let inputView = InputView()
    let inputValue = inputView.readInput()
    do {
        try myPoint = inputView.separateEachCoordinate(inputValue: inputValue)
        isNotCorrectInputValue = false
    } catch CoordinateError.inputValuesOfLineError {
        print("두 개의 입력값 형식 에러")
    }
} while(isNotCorrectInputValue)

var outputView = OutputView()
outputView.drawClear()
outputView.printMyPoint(myPoint: myPoint)
outputView.drawAxis()
