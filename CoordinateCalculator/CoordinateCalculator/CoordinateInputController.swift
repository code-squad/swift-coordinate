//
//  UserCoordinateReader.swift
//  CoordinateCalculator
//
//  Created by sungchan.you on 2019/09/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordinateInputController {

    func readCoordinates() -> [MyPoint] {
        var coordinates: [MyPoint] = []
        var userInput = CoordinateInputView.read(with: .read)

        while coordinates.count < CoordinateConstants.maxUserInput {
            guard isValid(userInput: userInput) else {
                userInput = CoordinateInputView.read(with: .retry(error: "잘못된 형식입니다:[입력:\(userInput)]"))
                continue
            }
            guard let coordinate = convert(userInput: userInput) else {
                userInput = CoordinateInputView.read(with: .retry(error: "내부 에러가 발생했습니다."))
                continue
            }

            let point = MyPoint(x: coordinate.x, y: coordinate.y)
            guard coordinates.contains(point) == false else {
                userInput = CoordinateInputView.read(with: .retry(error: "동일한 데이터가 존재합니다."))
                continue
            }
            coordinates.append(point)
            guard CoordinateInputView.read(with: .finish).bool == false else {
                break
            }
            userInput = CoordinateInputView.read(with: .read)
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
