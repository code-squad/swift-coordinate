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
        let input: String
        let point: MyPoint
        
        do {
            input = try InputView.readInput()
        } catch let error as InputView.Error {
            print(error.localizedDescription)
            continue
        } catch {
            print("예상치 못한 에러 발생: \(error).")
            continue
        }
        
        do {
            point = try CoordinateFormatter.makePoint(from: input, validator: CoordinateChecker())
            OutputView.draw(point: point)
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
