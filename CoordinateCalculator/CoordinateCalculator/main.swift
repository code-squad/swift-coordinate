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
        let pointOfInput = try InputView.readInput()
        OutputView.clean()
        OutputView.drawPoint(at: pointOfInput)
        OutputView.drawAxis()
    } catch InputViewError.invalidValue {
        print("유효하지 않은 값입니다.")
    } catch InputViewError.invalidFormat {
        print("유효하지 않은 형식입니다.")
    }
}
