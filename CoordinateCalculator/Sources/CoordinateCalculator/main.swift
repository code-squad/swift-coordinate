//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

while(true) {
    do {
        try OutputView.moveCoordinate(InputView().readInput()!)
    } catch InputViewError.emptyValue {
        print("입력값이 없습니다.")
    } catch InputViewError.outOfRangeCoordinate {
        print("좌표값이 범위를 벗어났습니다. 0에서 24이하로 입력하세요.")
    }
}




