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
        let pairs = try Parser.parse(using: input)
        let convertedPairs = try Converter.convert(pairs)
        if CoordinateValidator.isOutOfAxis(using: convertedPairs) {
            throw CoordinateError.outOfAxisRange
        }
        figure = try FigureFactory.makeFigure(numbers: convertedPairs)
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


