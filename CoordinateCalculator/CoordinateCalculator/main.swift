//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Figure {
    var xy : (Int,Int) {get}
}

func main() {
    let coordinate = validCoordinate()
    OutputView.drawAxis()
    OutputView.show(point: coordinate.xy)
}

func validCoordinate() -> Figure {
    var isRepeat = false
    while true {
        let inputCoordinate = InputView.readCoordinate(isRepeat)
        guard ValidCheck.characterCheck(inputCoordinate) else {isRepeat = true; continue}
        
        return FigureCreator.createFigure(inputCoordinate)
//        let inputPoint = FigureCreator.readPoint(inputCoordinate)
//        guard ValidCheck.rangeCheck(inputPoint) else {isRepeat = true; continue}
//        return inputPoint
    }
}

main()

