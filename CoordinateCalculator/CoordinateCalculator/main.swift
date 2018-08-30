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
        let checkedValue = try InputValueCheck().makeCheckedValues(inputCoordinates)
    
        OutputView.drawPoint(checkedValue)
        break
        }
    catch let error as ErrorMessage.Message {
        print (error.rawValue)
    }
}
