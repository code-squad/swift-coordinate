//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

let inputView = InputView()
let checkingInput = CheckingInput()
let adjustPoint = AdjustPoint()
let outputView = OutputView()
var myPointOutput : MyPointOutput

do {
    try myPointOutput =  adjustPoint.adjusting(checkingInput.checkInputError(inputView.readInput()))
    outputView.drawClear()
    outputView.drawPoint(myPointOutput)
    outputView.drawAxis()
} catch CheckingInput.InputError.emptyInput {
    print(CheckingInput.InputError.emptyInput.rawValue)
} catch CheckingInput.InputError.wrongInput {
    print(CheckingInput.InputError.wrongInput.rawValue)
} catch CheckingInput.InputError.overNumPoint {
    print(CheckingInput.InputError.overNumPoint.rawValue)
}



