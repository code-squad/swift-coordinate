//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

//OutputView.drawAxis()

let correct = "(10,9)"
let a = "(424)"
let b = "10,9)"
let c = "(q,2)"
let d = "(29,3)"

let input = d

let inputError = InputValidator(input:input).checkInputError()

if (inputError != .noError){
    print(inputError.rawValue)
} else {
    let coordinate = InputView.separateCoordinate(input:input, separator:",")
    print(MyPoint(x:Int(coordinate.x)!,y:Int(coordinate.y)!))
}
