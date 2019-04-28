//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    let input = InputView().readInput()
    let inspect: Inspection = Inspection(item: input)
    if let result = inspect.validation() {
        OutputView.printError(message: result)
        return
    }
    guard let passedPoint = Inspection(item: input).point() else { return }
    OutputView.mark(at: passedPoint)
    return
}

main()

