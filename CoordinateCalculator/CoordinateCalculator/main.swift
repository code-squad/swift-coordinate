//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordinateCalculator {
    static var runAgain = true
    
    static func run() {
        let coordinatesInput = InputView.readInput()
        let coordinates: [String] = coordinatesInput.splitByHyphen()
        var points = [Point]()
        for coordinate in coordinates {
            guard let point = ShapeGenerator.generatePoint(from: coordinate) else { return }
            points.append((x: point.x, y: point.y))
        }
        let shape = ShapeGenerator.generateShape(by: points)
        OutputView.drawShape(shape)
        runAgain = false
    }
}

while(CoordinateCalculator.runAgain) {
    CoordinateCalculator.run()
}
