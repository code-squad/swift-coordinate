//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Yoda Codd on 2018. 4. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    /// 사용자 입력값을 받는 함수
    func receiveUserInput()->String{
        print("좌표를 입력하세요. 예시: (12,4)")
        guard let userInput =  readLine() else {
            return ""
        }
        return userInput
    }
}
