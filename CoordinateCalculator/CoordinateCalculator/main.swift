//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func run() {
    let validatedInput = inputValidate()
    let coordinate = Converter.convertToCoordinate(validatedInput)
    OutputView.drawAxis(coordinate)
}

func inputValidate() -> (Int,Int) {
    var validatedInput:(Int,Int)
    repeat{
        let userInput = InputView.readInput(.requestCoordinate)
        var validator = Validator()
        do {
            validatedInput = try validator.verifyInput(userInput)
            return validatedInput
        }catch let error as UserInputError{
            print(error.description)
            continue
        }catch {
            print(UserInputError.unknown.description)
            continue
        }
    }while true
}

run()

