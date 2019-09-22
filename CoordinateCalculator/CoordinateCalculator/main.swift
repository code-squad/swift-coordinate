//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

typealias Point = (x: Int, y: Int)

var point = InputView.readPoint()
let outputView = OutputView(point: point)
outputView.drawAll()
