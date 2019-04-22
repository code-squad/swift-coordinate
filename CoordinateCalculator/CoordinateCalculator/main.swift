//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

while true {
    
    guard let result = InputView.readInput(of: "좌표를 입력하세요. ex. (10,10)") else {
        continue
    }
    
    let myPoint = MyPoint(x: result.x, y: result.y)
    let output = OutputView(point: myPoint)
    
    output.drawAxis()
    
    break
}


