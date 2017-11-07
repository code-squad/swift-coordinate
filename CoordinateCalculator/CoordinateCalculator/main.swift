//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

var inputView = InputView()
inputView.readInput()
var myPoint = inputView.separateCoordinateNumber()

var outputView = OutputView()
outputView.drawClear()
outputView.printMyPoint(myPoint: myPoint)
outputView.drawAxis()
