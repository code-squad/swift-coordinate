//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


func main() {
    let point = InputView.readInput()

    OutputView.drawAxis()
    OutputView.draw(with: point)
    OutputView.finishingOperation()
    
    //print(point) for debug
}

main()

