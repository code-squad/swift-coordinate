//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by cushy k on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    private func deliver(message: String) {
        print(message)
    }

    func readInput() -> String {
        deliver(message: "좌표를 입력하세요. ")
        return readLine() ?? ""
    }
}
