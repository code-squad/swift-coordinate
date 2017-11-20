//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 17..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    func readInput() -> String? {
        let inputValue: String?
        print("좌표값을 입력하세요(','로 구분 / 숫자로 입력)")
        inputValue = readLine()
        return inputValue
    }
}
