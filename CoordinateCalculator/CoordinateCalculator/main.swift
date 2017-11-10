//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func executeCoordinatesCalculator() {
    let inputView = InputView()
    let outputView = OutputView()
    var model = CoordinateModel()
    var rawPoints = RawCoordinate()
    let controller = Calculator()
    var checkError = false
    
    while !checkError {
        do {
            try rawPoints = inputView.readInput()
            try model = controller.extract(rawPoints)
            outputView.draw(model)
            checkError = true
        } catch InputViewError.invalidPoint {
            checkError = false
        } catch InputViewError.invalidCharacterSet {
            checkError = false
        } catch InputViewError.invalidRectangle {
            checkError = false
        } catch {
            checkError = false
        }
    }
}

executeCoordinatesCalculator()
