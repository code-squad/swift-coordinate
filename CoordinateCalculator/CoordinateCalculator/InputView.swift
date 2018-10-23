//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 2018. 10. 18..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    // 사용자의 입력을 받음
    func readInput(message: String) -> String {
        print(message)
        guard let input = readLine() else { return "" }
        return input
    }
}
