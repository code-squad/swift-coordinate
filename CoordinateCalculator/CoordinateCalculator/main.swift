//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

var runCoordinatesCalculator : Bool = true
mainLoop : while runCoordinatesCalculator == true {
    let userInput = InputView().readInput()
    let userPoints = InputView().seperateCoordinates(userInput: userInput)
    guard userPoints.x <= 24 || userPoints.y <= 24 else {
        print("X 또는 Y좌표가 24보다 값이 큽니다. 다시 입력해주세요.")
        continue
    }
    OutputView().drawPoint(inputPoints: userPoints)
}
