//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func run() {
    while(true) {
        do {
            let coordinates = try InputView.readCoordinates()
            let coordinateConverter = CoordinateConverter(validator: CoordinateChecker())
            let shape = try coordinateConverter.makeShape(from: coordinates)
            OutputView.draw(shape)
            break
        } catch let error as InputView.Error {
            print(error.localizedDescription)
            continue
        } catch let error as CoordinateConverter.Error {
            print(error.localizedDescription)
            continue
        } catch {
            print("예상치 못한 에러 발생: \(error).")
            continue
        }
    }
}

run()
