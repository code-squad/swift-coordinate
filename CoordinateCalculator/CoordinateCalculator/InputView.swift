//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Eunjin Kim on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    func readInput() -> String {
        print("좌표를 입력하세요.")
        if let inputCoordinate = readLine() {
            return inputCoordinate
        }
        return ""
    }
    
}
