//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    var isRepeat = false
    var inputCoordinate = InputView.readPoint(isRepeat: isRepeat)
    while !ValidCheck.lengthCheck(point: inputCoordinate) {
        isRepeat = true
        inputCoordinate = InputView.readPoint(isRepeat: isRepeat)
    }
    
    OutputView.drawAxis()
    OutputView.show(point: inputCoordinate.xy)
}

main()

