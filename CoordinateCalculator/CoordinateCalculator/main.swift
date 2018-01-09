//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

while true {
    let input = InputView().readInput()
    let coodinates = InputView().separateCoodinates(input!)
    guard coodinates.x < 25 && coodinates.y < 25 else { print("좌표 최댓값은 24입니다. 다시 입력해주세요"); continue }
    OutputView().drawCoordinates(coodinates)
    break
}
