//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

while true {
    let message = "좌표를 입력하세요 ex)(10,10)-(14,15)"
    let input = InputView().readInput(message)
    let checkVaildValue = InputView().checkInput(input)
    guard checkVaildValue == true else {
        print("좌표값 형태로 다시 입력해 주세요.")
        continue }
    guard let inputCoodinates =  InputView().separateInput(input) else { continue }
    guard InputView().checkMaxValue(inputCoodinates) == true else {
        print("좌표 최댓값은 24입니다. 다시 입력해주세요")
        continue }
    switch inputCoodinates.count {
    case 2: //Line
        let line: MyLine = MyLine.init(inputCoodinates)
        OutputView().drawLine(line)
    default: //point
        let point: MyPoint = inputCoodinates[0]
        OutputView().drawCoordinates(point)
    }
    break
}
