//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Choi Jeong Hoon on 2017. 11. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    func readInput () -> String {
        print ("""
         <좌표계산기> 아래와같은 형태로 좌표를 입력해주세요
         1. 점한개 : (12,24)
         2. 점두개 : (12,24)-(14,20)
         3. 점세개 : (12,23)-(11,10)-(15,20)
         """)
        if let coordinates = readLine() {
            guard coordinates.contains("q")  else { return coordinates}
        }
        return "q"
    }
}

