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
        try myPoint = inputView.separateCoordinateNumber(inputValue: inputValue)
        isNotCorrectInputValue = false
    } catch CoordinateError.noCommaError {
        print("콤마가 없음")
    } catch CoordinateError.noBracketError {
        print("괄호가 없음")
    } catch CoordinateError.theRestError {
        print("그 외의 에러")
    }
} while(isNotCorrectInputValue)

var outputView = OutputView()
outputView.drawClear()
outputView.printMyPoint(myPoint: myPoint)
outputView.drawAxis()
