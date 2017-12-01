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
        let stringCoords = InputView().readInput()
        if stringCoords == "q" {
            break
        }
        let shapes = try MakingMyShape().makeShapeInstance(stringCoords)
        OutputView().printShape(shapes)
    } catch let error as SyntaxChecker.ErrorMessage {
        print (error.rawValue)
    } catch {
        print (SyntaxChecker.ErrorMessage.ofUnKnownError.rawValue)
    }
}
