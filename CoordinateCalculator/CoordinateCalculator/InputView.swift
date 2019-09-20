//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by temphee.Reid on 20/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    static func readPoint() -> String {
        print("좌표를 입력하세요.")
        let value = readLine() ?? ""
        return value
    }
}
