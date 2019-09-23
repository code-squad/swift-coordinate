//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by junwoo on 2019/09/23.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    static func readInput() -> MyPoint {
        print("좌표를 입력하세요.")
        let inputString = readLine() ?? ""
        let point = StringConverter.modify(str: inputString)
        guard point.isValid else {
            print("좌표 범위 에러")
            return readInput()
        }
        return point
    }
}

extension MyPoint {
    var isValid: Bool {
        return x <= 24 && y <= 24
    }
}
