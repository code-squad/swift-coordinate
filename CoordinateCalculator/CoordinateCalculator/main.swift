//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordinateCalculate {
    static func run() {
        let input = InputView.readInput()
        let inputError = InputValidator(input:input).checkInputError()
        
        guard inputError == .noError else {
            print(inputError.rawValue)
            return
        }
        let coordinate = InputView.getCoordinate(input:input)
        let myPoint = MyPoint(x:coordinate.x, y:coordinate.y)
        OutputView.drawPoint(point: myPoint)
    }
}

CoordinateCalculate.run()
