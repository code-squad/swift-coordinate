//
//  convertInput.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 20/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

// ConvertInput 구조체의 역할 : 입력 형태가 올바른지 확인하고, 올바른 경우 정수형 좌표로 변환
struct ConvertInput {
    private let input: String
    
    init(correctInput: String) {
        self.input = correctInput
    }
    
    
}
