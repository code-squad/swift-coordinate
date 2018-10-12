//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 윤지영 on 04/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    static private let guideMessage = "좌표를 입력하세요."
    
    static func readInput() -> String {
        print(guideMessage)
        guard let input:String = readLine() else { return String() }
        return input
    }
}
