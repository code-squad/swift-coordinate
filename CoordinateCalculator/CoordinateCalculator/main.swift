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
        let checkedValue = try SyntaxChecker().makeCheckedValues(InputView().readInput())
        if checkedValue.x == 0 && checkedValue.y == 0 {
            break
        }
        OutputView.drawPoint(checkedValue)
    } catch let error as SyntaxChecker.ErrorMessage {
        print (error.rawValue)
    } catch {
        print (SyntaxChecker.ErrorMessage.ofUnKnownError.rawValue)
    }
}
