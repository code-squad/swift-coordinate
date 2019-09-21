//
//  LiteralPointValidator.swift
//  CoordinateCalculator
//
//  Created by sungchan.you on 2019/09/21.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol UserInputValidatable {
    func isValid(userInput: String) -> Bool
}

struct LiteralPointValidator: UserInputValidatable {
    func isValid(userInput: String) -> Bool {
        let regex = "\\(([0-1]{0,1}[0-9]|[2][0-4]),\\s{0,1}([0-1]{0,1}[0-9]|[2][0-4])\\)"
        return userInput.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
