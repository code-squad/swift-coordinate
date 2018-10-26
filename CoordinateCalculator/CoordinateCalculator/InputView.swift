//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 2018. 10. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    static func readInput(ment:String) -> String {
        print(ment)
        return readLine() ?? ""
    }
}
