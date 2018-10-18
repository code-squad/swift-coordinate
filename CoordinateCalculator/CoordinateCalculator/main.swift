//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    let inputCoordinate = InputView.readInput()
    
    OutputView.drawAxis()
    OutputView.show(point: inputCoordinate.xy)
}

main()
