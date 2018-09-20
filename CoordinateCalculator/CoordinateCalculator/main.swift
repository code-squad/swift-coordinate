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
        let pointSet = try ProtocolFactory.convertProtocol(coordinatePoint)
        OutputView.drawPoint(pointSet)
        if let calculatableShapes = pointSet as? FigureCalculation {
            OutputView().printAxisExplanation(myProtocol: calculatableShapes)
        }
        break
    }
    catch let error as ErrorMessage.Message {
        print (error.rawValue)
    }
}
