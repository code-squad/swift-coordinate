//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    let willShowCoordinate = validCoordinate()
    OutputView.drawAxis()
    OutputView.show(willShowCoordinate)
}

func validCoordinate() -> MyPoint {
    var isRepeat = false
    while true {
        let inputCoordinate = InputView.readCoordinate(isRepeat)
        guard ValidCheck.characterCheck(inputCoordinate) else {isRepeat = true; continue}
        
        let coordinates = FigureCreator.separateHyphen(inputCoordinate)
        let points = coordinates.map {FigureCreator.readPoint($0)}
        guard ValidCheck.rangeCheck(points) else {isRepeat = true; continue}
        
        return FigureCreator.createFigure(points)
    }
}

main()

