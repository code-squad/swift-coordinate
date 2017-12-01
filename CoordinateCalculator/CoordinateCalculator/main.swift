//
//  main.swift
//  CoordinateCalculator
//
//  Created by Choi Jeong Hoon on 2017. 11. 27..
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

while (true) {
    do {
        let inputValue = InputView().readInput()
        if inputValue == "q" {
            break
        }
        let values = try makingMyShape().makeShapeInstance(inputValue)
        OutputView().printShape(values)
    } catch let error as SyntaxChecker.ErrorMessage {
        print (error.rawValue)
    } catch {
        print (SyntaxChecker.ErrorMessage.ofUnKnownError.rawValue)
    }
}
