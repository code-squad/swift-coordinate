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
        let userInputValue = try InputView.readInput()
        
        if userInputValue == "q"{
            print("종료합니다.")
            exit(0)
        }
        
        OutputView.clean()
        OutputView.drawPoint(at: MyPoint(x: 10, y: 10))
        OutputView.drawAxis()
    } catch InputViewError.invalidValue {
        print("유효하지 않은 값입니다.")
    }
}
