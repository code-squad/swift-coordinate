//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

while true {
    
    let prompt = InputView.readInput(of: "좌표를 입력하세요. ex. (10,10) 좌표값이 여러개일경우 -를 이용해 입력해주세요. ex. (1,2)-(3,4)")
    
    guard Validator.validateInput(of: prompt) else {
        print("사용할 수 없는 문자가 입력되었습니다. 숫자(0-9), 괄호(), 쉼표(,), 대시(-)만을 사용해주세요.")
        continue
    }
    
    guard let figure = Converter.toFigure(from: prompt) else {
        print("x, y 값은 최대 24까지 입력할 수 있습니다.")
        continue
    }

    OutputView.drawCoordinates(of: figure)
    
    break
}
