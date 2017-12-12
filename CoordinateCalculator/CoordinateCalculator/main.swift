//
//  main.swift
//  CoordinateCalculator
//
//  Created by jack on 2017. 12. 08
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

var runCoordinatesCalculator : Bool = true
mainLoop : while runCoordinatesCalculator == true {
    let inputView : InputView = InputView()
    let userInput = inputView.readInput()
    guard userInput != "q" else {break}
    if inputView.checkValidCharacters(userInput: userInput) == false {
        print("다시 입력해주세요. 좌표값 형태가 아닙니다. ")
        continue
    }
    let userPoints = inputView.seperateCoordinates(userInput: userInput)
    if inputView.checkLimitCondition(coordinates: userPoints) == false {
        print("다시 입력해주세요. X 또는 Y가 24보다 큰 값이 있습니다.")
        continue
    }
    
    OutputView().printShape(userPoints)
}
