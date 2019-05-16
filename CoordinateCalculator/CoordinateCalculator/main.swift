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
        let coordinates: [String]
        let points: [MyPoint]
        
        do {
            coordinates = try InputView.readCoordinates()
        } catch let error as InputView.Error {
            print(error.localizedDescription)
            continue
        } catch {
            print("예상치 못한 에러 발생: \(error).")
            continue
        }
        
        do {
            points = try coordinates.map { try CoordinateFormatter.makePoint(from: $0, validator: CoordinateChecker()) }
            OutputView.draw(point: points[0])
            break
        } catch let error as CoordinateFormatter.Error {
            print(error.localizedDescription)
            continue
        } catch {
            print("예상치 못한 에러 발생: \(error).")
            continue
        }
    }
}

run()
