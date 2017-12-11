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
    let inputView : InputView = InputView()
    let userInput = inputView.readInput()
    guard userInput != "q" else {break}
    let userPoints = inputView.seperateCoordinates(userInput: userInput)
    if userPoints[0] > 24 || userPoints[1] > 24 {
        print("X 또는 Y좌표가 24보다 값이 큽니다. 다시 입력해주세요.")
        continue
    }
    
    let myPoint : MyPoint = MyPoint.init(userPoints)

    OutputView().drawPoint(inputPoints: myPoint)
}
