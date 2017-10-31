//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

var inputView = InputView()
let points = inputView.readInput()

var outputView = OutputView(points: points)
outputView.clearAxis()
outputView.drawPoints()
outputView.drawAxis()
outputView.getCalculateResult()


