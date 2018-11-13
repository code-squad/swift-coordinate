//
//  main.swift
//  CoordinateCalculator
//
//  Created by Elena on 31/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct Main {
     static func coordinateStart() {
        var repetition = true
        while(repetition) {
            let point = InputView.getUserCoordinate()
            if let pointPrint = point[0] , point[0] != nil {
                repetition = false
                OutputView().drawPoint(inputPoints: pointPrint)
            }
        }
    }
}

Main.coordinateStart()

