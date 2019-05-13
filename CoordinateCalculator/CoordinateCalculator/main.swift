//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func run() {
    repeat {
        do {
            let input = try InputView.readInput()
            let point = try CoordinateFormatter.makePoint(from: input)
            OutputView.draw(point: point)
            break
        } catch let error as InputView.Error {
            print(error.localizedDescription)
        } catch let error as CoordinateFormatter.Error {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
    } while(true)
}

run()
