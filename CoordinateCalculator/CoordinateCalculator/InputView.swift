//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by rhino Q on 2018. 3. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

enum InputViewError:Error {
    case invalidValue
    case invalidFormat
}

struct InputView{
    
    static func readInput() throws -> String {
        print("좌표를 입력하세요.")

        guard let rawInput = readLine(), !rawInput.isEmpty else {
           throw InputViewError.invalidValue
        }

        return rawInput
    }
    
}
