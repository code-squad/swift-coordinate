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
            guard let points = InputView.read() else { continue }
            if points.count == 1 {
                OutputView.drawAxis(with: MyPoint(points))
            }else if points.count == 2 {
                OutputView.drawAxis(with: MyLine(points))
            }
            break
        }
    }
}

Main.start()
