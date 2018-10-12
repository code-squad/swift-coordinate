//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordinateCalculator {
    static func run() {
        let coordinate = InputView.readInput()
        let coordinatesValidation = TextValidator(text:coordinate).checkTextError()
        guard coordinatesValidation == .success else {
            print(coordinatesValidation.rawValue)
            return
        }
        let coordinates = TextProcessor.extractXY(from: coordinate)
        let myPoint = MyPoint(x:coordinates.x, y:coordinates.y)
        OutputView.drawPoint(point: myPoint)
    }
}

CoordinateCalculator.run()
