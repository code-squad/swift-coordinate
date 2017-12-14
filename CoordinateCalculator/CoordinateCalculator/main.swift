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
    guard inputView.checkValidCharacters(userInput: userInput) == true else { continue }
    
    let userPoints = inputView.seperateCoordinates(userInput: userInput)
    guard inputView.checkLimitCondition(coordinates: userPoints) == true else { continue }
    
    let userShape = inputView.selectShape(points: userPoints)
    
    OutputView().printShape(userShape)
}
