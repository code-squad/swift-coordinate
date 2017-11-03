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
        func checkErrorBeforeDrawing() -> Bool {
            do {
                pointInfo = try inputView.extract()
                outView.draw(point: pointInfo)
                return true
            } catch InputViewError.invalidPoint {
                return false
            } catch {
                return false
            }
        }
        checkError = checkErrorBeforeDrawing()
    }
}

executeCoordinatesCalculator()
