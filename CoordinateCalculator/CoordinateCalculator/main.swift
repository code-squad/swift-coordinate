//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

while (true) {
    do {
        let inputCoordinates = InputView().inputCoordinates()
        let coordinatePoint = try InputValueCheck().makeCheckedValues(inputCoordinates)
        let point = try ProcotolFactory.convertProtocol(coordinatePoint)
        OutputView.drawPoint(point)
        break
    }
    catch let error as ErrorMessage.Message {
        print (error.rawValue)
    }
}
