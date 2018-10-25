//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    let willShowFigure = validCoordinate()
    OutputView.drawAxis()
    willShowFigure.callShow()
}

func validCoordinate() -> Figure {
    var isRepeat = false
    while true {
        let inputCoordinate = InputView.readCoordinate(isRepeat)
        guard inputCoordinate.isValidCharacter() else {isRepeat = true; continue}
        
        let coordinates = FigureCreator.separateHyphen(inputCoordinate)
        let points = coordinates.map {FigureCreator.readPoint($0)}
        guard ValidCheck.rangeCheck(points) else {isRepeat = true; continue}
        
        return FigureCreator.createFigure(points)
    }
}

main()

