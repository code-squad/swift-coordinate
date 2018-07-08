//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func loopMain() {
    repeat {
        OutputView.clear()
        let iv = InputView()
        iv.inputFigure()
    } while(readLine() != "q")
}

loopMain()
