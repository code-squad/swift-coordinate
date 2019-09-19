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
            guard let point = MyPoint(coordinates: userInput) else {
                userInput = CoordinateInputView.read(with: .retry(error: "내부 에러가 발생했습니다."))
                continue
            }
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
