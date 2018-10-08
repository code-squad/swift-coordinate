//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


struct CoordinateCalculate {
    func run() {
        let input = InputView.readInput()
        let inputError = InputValidator(input:input).checkInputError()
        
        guard inputError == .noError else {
            print(inputError.rawValue)
            return
        }
        
        let myPoint = InputView.makeMyPoint(input:input)
        print(myPoint)
        
        OutputView.drawAxis()
        OutputView.drawPoint(point: myPoint)
    }
}

CoordinateCalculate().run()
