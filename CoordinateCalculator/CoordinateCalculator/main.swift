//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func run() {
    var point: MyPoint!
    do {
        point = try InputView.readInput()
    } catch {
        print("Error: \(error)")
    }
    
    OutputView.drawAxis()
    OutputView.drawYellowDot(at: point)
}

run()
