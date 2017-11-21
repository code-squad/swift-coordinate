//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Choi Jeong Hoon on 2017. 11. 20..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    func readInput () -> String {
        print ("좌표를 입력해주세요 [ex : (12,23)]")
        if let coordinates = readLine() {
            guard coordinates.contains("q") || coordinates.contains("quit") else { return coordinates}
        }
        return "q"
    }
}
