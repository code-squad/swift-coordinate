//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by joon-ho kil on 4/18/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    private(set) var valueEntered: String = ""
    
    mutating func readInput () {
        print("좌표를 입력하세요.")
        valueEntered = readLine() ?? "0"
    }
}
