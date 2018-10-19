//
//  inputView.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 2018. 10. 18..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

// InputView 구조체의 역할 : 입력만 책임
struct InputView {
    private let mention: String
    
    init(mention: String) {
        self.mention = mention
    }
    
    public func readInput() -> String {
        print(self.mention)
        guard let rawValue = readLine() else {
            return "(-1,-1)"
        }
        return rawValue
    }
}
