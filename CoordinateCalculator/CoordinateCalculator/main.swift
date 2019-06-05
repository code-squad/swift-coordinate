//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func run() {
    var point:MyPoint?
    
    repeat{
        let userInput = InputView.readInput()
        var validator = Validator()
        do {
            point = try validator.verifyInput(userInput)
            break
        }catch let error as UserInputError{
            print(error.description)
            continue
        }catch{
            print("예상치 못한 에러 발생: \(error).")
            continue
        }
    }while true
    guard let provenpoint = point else { return }
    let coordinate = Converter.convertToCoordinate(provenpoint)
    OutputView.drawAxis(coordinate)
}

run()

