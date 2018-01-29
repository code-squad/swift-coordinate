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
    
    let point = MyFactory().makePoint(inputCoordinates)
    guard let area = MyFactory().calculateArea(inputCoordinates) else { break }
    guard OutputView().checkRect(point) == true else { continue }
    OutputView().drawCoordinates(point)
    OutputView().calculateShape(area)
    
}
