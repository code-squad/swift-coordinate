//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func run() throws {
    do {
        let input = try InputView.readInput()
        let point = try PointFormatter.point(from: input)
        OutputView.clear()
        OutputView.drawAxis()
        OutputView.draw(point: point)
    } catch let error as InputView.Error {
        print(error.localizedDescription)
    } catch let error as PointFormatter.Error {
        print(error.localizedDescription)
    }
}

try run()
