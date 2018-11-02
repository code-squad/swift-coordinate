//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by Jun ho Lee on 2018. 10. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    // 멘트를 출력하고 값을 입력받음
    static func receiveInput(ment: String) -> String {
        print(ment)
        return readLine() ?? ""
    }
    
}

