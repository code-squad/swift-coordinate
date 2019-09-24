//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

var inputString = InputMenu.readInput()

while !Validation.isValidInputLine(inputLine: inputString) {
    inputString = InputMenu.readInput()
}

let inputPoint:MyPoint = CoordinateFactory.createMyPoint(inputLine: inputString!)

OutputView.printPoint(point: inputPoint)
