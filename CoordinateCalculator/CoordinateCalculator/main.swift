//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

while true {
    
    let prompt = InputView.readInput(of: "좌표를 입력하세요. ex. (10,10)")
    
    guard Validator.validateInput(of: prompt) else {
        continue
    }
    
    guard let figure = Converter.toFigure(from: prompt) else {
        continue
    }

    OutputView.drawCoordinates(of: figure)
    
    break
}
