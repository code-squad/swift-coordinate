//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordinateCalculator {
    static var runAgain = true
    
    static func run() {
        let coordinate = InputView.readInput()
        let textValidator = TextValidator(text:coordinate)
        guard textValidator.hasNoInvalidCharacter() else {
            print("\(TextValidation.invalidForm.rawValue) \(TextValidation.outOfRangeInt.rawValue)")
            return
        }
        let coordinatesValidation = textValidator.checkTextError()
        guard coordinatesValidation == .success else {
            print(coordinatesValidation.rawValue)
            return
        }
        let coordinates = TextProcessor.extractXY(from: coordinate)
        let myPoint = MyPoint(x:coordinates.x, y:coordinates.y)
        OutputView.drawPoint(point: myPoint)
        runAgain = false
    }
}

while(CoordinateCalculator.runAgain) {
    CoordinateCalculator.run()
}
