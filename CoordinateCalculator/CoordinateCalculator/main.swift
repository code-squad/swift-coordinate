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
    
    guard let coordinates = Validator.validateInput(of: prompt) else {
        continue
    }
    
    let myPoint = MyPoint(x: coordinates.x, y: coordinates.y)
    
    OutputView.draw(point: myPoint)
    
    break
}


