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
            let points = try Converter.getMyPoints(readinput)
            let myModel = try Converter.getModel(points)
            OutputView.clean()

            if let mypoint = myModel as? MyPoint {
                // Controller의 역할 : 어느 뷰를 보여줄 것인지
                OutputView.drawPoint(mypoint)
                OutputView.drawAxis()
            }else if let myline = myModel as? MyLine {
                OutputView.drawLine(myline)
            }else {
                throw CoordinateError.unknownCaseError
            }
            
        }catch let e as CoordinateError {
            OutputView.errorMessage(of: e)
        }
    }
}
try main()

