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
    let outView = OutputView()
    var pointInfo = MyPoint()
    var checkError = false
    while !checkError {
        inputView.readInput()
        do {
            pointInfo = try inputView.extract()
            outView.draw(point: pointInfo)
            checkError = true
        } catch InputViewError.invalidPoint {
            checkError = false
        } catch {
            checkError = false
        }
    }
}

executeCoordinatesCalculator()
