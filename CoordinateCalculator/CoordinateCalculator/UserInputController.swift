//
//  UserInputController.swift
//  CoordinateCalculator
//
//  Created by sungchan.you on 2019/09/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct UserInputController {
    
    private let validator: UserInputValidatable
    
    init(validator: UserInputValidatable = LiteralPointValidator() ) {
        self.validator = validator
    }

    func readCoordinates() -> [MyPoint] {
        var coordinates: [MyPoint] = []
        var userInput = UserInputView.read(with: .read)

        while coordinates.count < CoordinateConstants.maxUserInput {
            guard validator.isValid(userInput: userInput) else {
                let error = CoordinateError.wrongInputFormat(message: userInput)
                userInput = UserInputView.read(with: .retry(error: error))
                continue
            }
            guard let coordinate = convert(userInput: userInput) else {
                let error = CoordinateError.internalError
                userInput = UserInputView.read(with: .retry(error: error))
                continue
            }

            let point = MyPoint(x: coordinate.x, y: coordinate.y)
            guard coordinates.contains(point) == false else {
                let error = CoordinateError.alreadyExist
                userInput = UserInputView.read(with: .retry(error: error))
                continue
            }
            coordinates.append(point)
            guard UserInputView.read(with: .finish).bool == false else {
                break
            }
            userInput = UserInputView.read(with: .read)
        }
        return coordinates
    }
    
    func convert(userInput: String) -> (x: Int, y: Int)? {
        let userInputs = userInput.trimmingCharacters(in: ["(",")"]).components(separatedBy: ",")
        guard let x = userInputs.first, let y = userInputs.last,
            let coordinateX = Int(x), let coordinateY = Int(y) else {
                return nil
        }
        return ((coordinateX + CoordinateConstants.xAxisStartPos) * CoordinateConstants.coordinatesMagnifyingFactor.x,
                CoordinateConstants.yAxisEndPos - (coordinateY * CoordinateConstants.coordinatesMagnifyingFactor.y))
    }
}

extension String {
    var bool: Bool {
        switch self.lowercased() {
        case "y", "yes" : return true
        case "n", "no" : return false
        default :       return false
        }
    }
}
