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
    OutputView.show(figure: willShowFigure)
}

func validCoordinate() -> Figure {
    var ment = "좌표를 입력하세요. //단, 숫자의 최대 크기는 24"
    let retypeMent = "입력값을 확인하시고 다시 입력 해주세요."
    while true {
        let inputCoordinate = InputView.readInput(ment: ment)
        guard inputCoordinate.isValidCharacter() else {ment = retypeMent; continue}
        
        let coordinates = FigureCreator.separateHyphen(inputCoordinate)
        let points = coordinates.map {FigureCreator.readPoint($0)}
        guard Check.isValidSize(points) else {ment = retypeMent; continue}
        guard Check.isValidNumberOfCoordinates(points) else {ment = retypeMent; continue}
        guard Check.isRect(points) else {ment = retypeMent; continue}
        
        return FigureCreator.createFigure(points)
    }
}

main()

