//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


func main() {
    
    var userInput = String()
    
    userInput = InputView.readInput(question: Question.coordinate.rawValue)
    
    if InputView.hasInvalidCharacter(in: userInput) {
        print("has invalid error")
    }
    
}

main()


