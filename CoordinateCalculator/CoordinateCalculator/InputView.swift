//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Elena on 29/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//
/*
 */

import Foundation
//입력
struct InputView {
    
    private static func readInput(ment: String) -> String {
        print(ment)
        return readLine() ?? ""
    }
    
    static func getUserString() -> String {
        let coordinate = readInput(ment: "좌표를 입력하세요.")
        let coordinates = coordinate.trimmingCharacters(in: .whitespacesAndNewlines)
        return coordinates
    }
}


