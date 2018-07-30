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
            guard let figure = FigureGenerator(points: points).generateFigure() else { continue }
            OutputView.drawAxis(with: figure)
            break
        }
    }
}

Main.start()
