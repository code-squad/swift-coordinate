//
//  main.swift
//  CoordinateCalculator
//
//  Created by Joon-ho Kil on 04/17/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

//MARK: Function
func main () {
    let outputView = OutputView()
    
    var inputView = InputView()
    var pointCoordinate = MyPoint()
    pointCoordinate = inputView.inputLoop(pointCoordinate)
    outputView.drawAxis()
    outputView.drawPoint(pointCoordinate)
}

main()

