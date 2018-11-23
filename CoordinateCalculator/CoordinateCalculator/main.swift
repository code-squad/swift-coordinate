//
//  main.swift
//  CoordinateCalculator
//
//  Created by Elena on 31/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

func coordinateStart() {
    var repetition = true
    while(repetition) {
        //입력
        let inputPoint = InputView.getUserString()
        //처리
        let coordinatesCount = InputView.checkHyphenCoordinate(inputPoint)
        // 출력
        repetition = MyShape().selectPosition(coordinatesCount,inputPoint)
    }
    
}

coordinateStart()

