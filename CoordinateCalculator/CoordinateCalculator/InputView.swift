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
        
        var localizedDescription: String {
            switch self {
            case .isEmpty:
                return "입력이 정의되지 않았습니다."
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
    
    static func readInput() throws -> String {
        return try readText(ask: .inputCoodinates)
    }
}
