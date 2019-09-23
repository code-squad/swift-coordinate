//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

let inputPoint = InputMenu.getCoordinateInfo()
CoordinatePrinter(initPoint: inputPoint).printPoint()
