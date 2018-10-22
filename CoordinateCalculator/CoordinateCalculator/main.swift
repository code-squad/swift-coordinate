//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    let coordinate = validCoordinate()
    OutputView.drawAxis()
    OutputView.show(point: coordinate)
}

func validCoordinate() -> MyPoint {
    var isRepeat = false
    while true {
        let inputCoordinate = InputView.readCoordinate(isRepeat)
        guard ValidCheck.characterCheck(inputCoordinate) else {isRepeat = true; continue}
        
        return FigureCreator.createFigure(inputCoordinate)
    }
}

main()

