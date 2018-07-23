//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

struct Main {
    static func start(){
        while true {
            guard let point = InputView.read() else { continue }
            let myPoint:MyPoint = point
            OutputView.drawAxis(with: myPoint)
            break
        }
    }
}

Main.start()
