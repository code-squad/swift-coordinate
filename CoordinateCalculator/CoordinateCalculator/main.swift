//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

let inputView = InputView()
let checking = CheckingInput()
let outputView = OutputView()
let factory = FactoryMyPoint()
var myPoint : MyPoint
let userInput = inputView.readInput()

do {
    let checkedInput = try checking.checkError(userInput)
    myPoint = factory.makeMyPoint(checkedInput)
    outputView.drawClear()
    outputView.drawPoint(myPoint)
    outputView.drawAxis()
} catch CheckingInput.ErrorCase.emptyInput {
    print(CheckingInput.ErrorCase.emptyInput.rawValue)
} catch CheckingInput.ErrorCase.wrongForm {
    print(CheckingInput.ErrorCase.wrongForm.rawValue)
} catch CheckingInput.ErrorCase.overNumPoint {
    print(CheckingInput.ErrorCase.overNumPoint.rawValue)
} catch CheckingInput.ErrorCase.lessNumPoint {
    print(CheckingInput.ErrorCase.lessNumPoint.rawValue)
}
