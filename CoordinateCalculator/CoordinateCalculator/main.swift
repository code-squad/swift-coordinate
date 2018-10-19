//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    let inputCoordinate = readCheckedCoordinate()
    OutputView.drawAxis()
    OutputView.show(point: inputCoordinate.xy)
}

func readCheckedCoordinate() -> MyPoint {
    var isRepeat = false
    while true {
        let inputPoint = InputView.readPoint(isRepeat: isRepeat)
        guard ValidCheck.characterCheck(inputPoint) else {isRepeat = true; continue}
        let inputCoordinate = InputView.readXY(inputPoint)
        guard ValidCheck.sizeCheck(inputCoordinate) else {isRepeat = true; continue}
        return inputCoordinate
    }
}

main()

