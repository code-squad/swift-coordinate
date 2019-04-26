//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

while true {
    var figure: AxisDrawable!
    do {
        let input = try InputView.readInput()
        let tokens = try Parser.parse(using: input)
        let numbers = try Converter.convert(tokens)
        if CoordinateValidator.isOutOfAxis(using: numbers) {
            throw CoordinateError.outOfAxisRange
        }
        figure = try FigureFactory.makeFigure(numbers: numbers)
    } catch let e as CoordinateError {
        print(e.rawValue)
        continue
    } catch {
        print("Other Unexpected Error")
        break
    }
    OutputView.drawAxis()
    OutputView.drawYellowDot(using: figure)
    break
}


