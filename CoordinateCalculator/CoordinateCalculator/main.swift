//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    let input = InputView()
    let inputedCoordinate = input.readInput()
    let myPoint = MyPoint(x: inputedCoordinate[0], y: inputedCoordinate[1])
    let output = PrintView()
    output.eraseDisplay()
    output.drawCoordinate(point: myPoint)
}

main()

