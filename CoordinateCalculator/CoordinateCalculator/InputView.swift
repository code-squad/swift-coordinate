//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by rhino Q on 2018. 3. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView{
    static func readInput(){
        print("좌표를 입력하세요.")
        guard let userInputValue = readLine() else {
            return
        }
        print(userInputValue)
    }
}
