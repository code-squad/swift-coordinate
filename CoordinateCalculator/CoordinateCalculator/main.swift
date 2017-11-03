//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func executeCoordinatesCalculator() -> Bool{
    var inputView = InputView()
    let outView = OutputView()
    var pointInfo = MyPoint()
    inputView.readInput()
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

var result = true
repeat {
    result = executeCoordinatesCalculator()
}while !result
