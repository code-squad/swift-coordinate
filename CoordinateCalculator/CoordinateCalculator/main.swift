//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func run() {
    
    repeat{
        let userInput = InputView.readInput(.requestCoordinate)
        var converter = Converter()
        let outputView = OutputView()
        
        do {
            let convertedInput = try converter.converterChoice(userInput)
            try outputView.drawAxis(convertedInput)
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
