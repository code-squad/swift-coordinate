//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func executeCoordinatesCalculator() {
    var inputView = InputView()
    let outputView = OutputView()
    let coordinateModel = CoordinateModel()
    let coordinateCalculator = Calculator()
    var checkError = false
    while !checkError {
        do {
            try inputView.readInput()
            coordinateModel.pointsKind = inputView.countPointsValue()
            coordinateModel.trixInfo.point = try inputView.extract()
            coordinateCalculator.sortAndMakePoints(coordinateModel)
            outputView.draw(coordinateModel)
            checkError = true
        } catch InputViewError.invalidPoint {
            checkError = false
        } catch InputViewError.invalidCharacterSet {
            checkError = false
        } catch {
            checkError = false
        }
    }
}

executeCoordinatesCalculator()
