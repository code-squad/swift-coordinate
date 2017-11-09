//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

var inputView = InputView()
var inputValue = inputView.readInput()
var myPoint = inputView.separateCoordinateNumber(inputValue: inputValue)
print("x,y: ",myPoint.x, myPoint.y)

var outputView = OutputView()
outputView.drawClear()
outputView.printMyPoint(myPoint: myPoint)
outputView.drawAxis()
