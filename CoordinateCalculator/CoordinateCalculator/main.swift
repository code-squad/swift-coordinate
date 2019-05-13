//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func run() throws {
    repeat {
        do {
            let input = try InputView.readInput()
            let point = try CoordinateFormatter.point(from: input)
            OutputView.draw(point: point)
        } catch let error as InputView.Error {
            print(error.localizedDescription)
        } catch let error as CoordinateFormatter.Error {
            print(error.localizedDescription)
        }
    } while(true)
}

try run()
