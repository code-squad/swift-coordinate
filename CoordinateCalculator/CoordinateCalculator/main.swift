//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

while true {
    let message = "좌표를 입력하세요 ex)(10,10)-(22,10)-(22,18)-(10,18)"
    let input = InputView().readInput(message)
    let checkVaildValue = GrammarChecker().isVaildInput(input)
    guard checkVaildValue == true else {
        print("좌표값 형태로 다시 입력해 주세요.")
        continue }
    guard let inputCoordinates = InputView().makePoints(input) else { continue }
    guard GrammarChecker().isUnderNumber(inputCoordinates) == true else {
        print("좌표 최댓값은 24입니다. 다시 입력해주세요")
        continue }
    guard MyRect(inputCoordinates).isRectangle() == true else {
        print("직사각형만 입력 가능합니다. 다시 입력해주세요")
        continue }
    switch inputCoordinates.count {
    case 2: //Line
        let line: MyLine = MyLine.init(inputCoordinates)
        OutputView().drawLine(line)
    case 3: //Triangle
        let triangle: MyTriangle = MyTriangle.init(inputCoordinates)
        OutputView().drawTriangle(triangle)
    case 4: //rect
        let rect: MyRect = MyRect.init(inputCoordinates)
        OutputView().drawRect(rect)
    default: //point
        let point: MyPoint = inputCoordinates[0]
        OutputView().drawCoordinates(point)
    }
    break
}
