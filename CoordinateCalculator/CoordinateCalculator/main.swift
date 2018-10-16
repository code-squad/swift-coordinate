//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    let XY = InputView.readInput()
    
    OutputView.show(point: XY)
    OutputView.drawAxis()
}
