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
    
    print(result)
    OutputView.drawAxis()
    
    break
}


