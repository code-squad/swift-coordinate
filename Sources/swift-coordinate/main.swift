//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

var inputView = InputView()
var outputView = OutputView()

let myPoint = inputView.readInput()
outputView.clearAxis()
outputView.drawPoint(myPoint: myPoint)
outputView.drawAxis()


