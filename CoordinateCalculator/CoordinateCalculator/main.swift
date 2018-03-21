//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func checkQuit(_ input:String) {
    if input == "q"{
        print("종료합니다")
        exit(0)
    }
}

while true {
    do {
        let input = try InputView.readInput()
        checkQuit(input)
        OutputView.clean()
        OutputView.drawPoint(at: MyPoint(x: 10, y: 10))
        OutputView.drawAxis()
    } catch InputViewError.invalidValue {
        print("유효하지 않은 값입니다.")
    } catch InputViewError.invalidFormat {
        print("유효하지 않은 형식입니다.")
    }
}
