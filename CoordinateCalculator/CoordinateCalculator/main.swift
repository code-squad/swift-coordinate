//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

while (true) {
    do {
        let inputValue = InputView().readInput()
        if inputValue == "q" {
            break
        }
        let checkedValue = try SyntaxChecker().makeCheckedValues(inputValue)
        OutputView.drawPoint(checkedValue)
    } catch let error as SyntaxChecker.ErrorMessage {
        print (error.rawValue)
    } catch {
        print (SyntaxChecker.ErrorMessage.ofUnKnownError.rawValue)
    }
}
