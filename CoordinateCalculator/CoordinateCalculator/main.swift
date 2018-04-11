//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() throws {
    while true {
        do {
            let readinput = try InputView.readInput(q: COORDINATE_START_INPUT_MESSAGE)
            try InputViewChecker.formatChekcer(checkerFormat: readinput)
            OutputView.clean()
            OutputView.draw(try readinput.getProcessKey(), try Spliter.getMyPoints(readinput))
        }catch let e as CoordinateError {
            OutputView.errorMessage(of: e)
        }
    }
}
try main()

