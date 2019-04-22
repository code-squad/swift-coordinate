//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Daheen Lee on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    func readInput() -> MyPoint {
        let question = "좌표를 입력하세요."
        print(question)
        guard let line = readLine() else {
            return MyPoint()
        }
        return parseIntoPoint(using: line)
    }
    
    
}
