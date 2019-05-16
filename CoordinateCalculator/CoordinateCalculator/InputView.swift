//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 8..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    enum Error: Swift.Error {
        case isEmpty
        case invalidCharacters
        
        var localizedDescription: String {
            switch self {
            case .isEmpty:
                return "입력이 정의되지 않았습니다."
            case .invalidCharacters:
                return "유효하지 않은 문자가 입력되었습니다."
            }
        }
    }
    
    enum Question: String {
        case inputCoodinates = "좌표를 입력하세요."
    }
    
    static private func readText(ask question: Question) throws -> String {
        print(question.rawValue)
        guard let input = readLine(), !input.isEmpty else {
            throw InputView.Error.isEmpty
        }
        return input
    }
    
    static func readCoordinates() throws -> [String] {
        let text = try readText(ask : .inputCoodinates)
        guard text.validateCoordinate() else {
            throw InputView.Error.invalidCharacters
        }
        return text.components(separatedBy: "-")
    }
}
