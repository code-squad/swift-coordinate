//
//  UserInputController.swift
//  CoordinateCalculator
//
//  Created by sungchan.you on 2019/09/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct UserInputController {
    
    private let inputReader: UserInputReadable
    private let validator: UserInputValidatable
    
    init(inputReader: UserInputReadable = UserInputView(),
         validator: UserInputValidatable = LiteralPointValidator() ) {
        self.inputReader = inputReader
        self.validator = validator
    }
    
    func readValidString(tries: Int) -> String? {
        var validInput: String?
        var prompt: Prompt = .read

        for _ in 0..<tries {
            let userInput = inputReader.read(with: prompt)
            guard validator.isValid(userInput: userInput) else {
                let message = "입력형식:(10,10) 입력:\(userInput)]"
                prompt = .retry(error: CoordinateError.wrongInputFormat(message: message))
                continue
            }
            validInput = userInput
            break
        }
        return validInput
    }

    func readPoint(tries: Int) throws -> MyPoint {
        guard let userString = readValidString(tries: tries) else {
            throw CoordinateError.exceedMaxUserInput
        }
        guard let point = MyPoint(string: userString) else {
            // Error casued by system. Not testable
            throw CoordinateError.internalError
        }
        return point
    }
}
