//
//  UserInputController.swift
//  CoordinateCalculator
//
//  Created by sungchan.you on 2019/09/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct UserInputController {

    func readCoordinates() -> [MyPoint] {
        var coordinates: [MyPoint] = []
        var userInput = UserInputView.read(with: .read)

        while coordinates.count < CoordinateConstants.maxUserInput {
            guard isValid(userInput: userInput) else {
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
    
    func isValid(userInput: String) -> Bool {
        let regex = "\\(([0-1]{0,1}[0-9]|[2][0-4]),\\s{0,1}([0-1]{0,1}[0-9]|[2][0-4])\\)"
        return userInput.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
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
