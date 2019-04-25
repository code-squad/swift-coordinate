//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

while true {
    var numbers: [Int]!
    do {
        let input = try InputView.readInput()
        let tokens = try Parser.parse(using: input)
        numbers = try Converter.convert(tokens)
        if CoordinateValidator.isOutOfAxis(using: numbers) {
            throw CoordinateError.outOfAxisRange
        }
    } catch let e as CoordinateError {
        print(e.rawValue)
        continue
    } catch {
        print("Other Unexpected Error")
        break
    }
    
    let point = MyPoint(x: numbers.0, y: numbers.1)
    OutputView.drawAxis()
    OutputView.drawYellowDot(at: point)
    break
}


