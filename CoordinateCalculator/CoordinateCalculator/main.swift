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

let points = inputView.readInput()
outputView.clearAxis()
outputView.drawPoints(points: points)
outputView.drawAxis()


