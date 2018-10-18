//
//  inputView.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 2018. 10. 18..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    private var mention: String
    
    init(mention: String) {
        self.mention = mention
    }
    
    public func readInput() -> String {
        let rawValue = readLine()
        return validity(rawValue)
    }
    
    private func validity(_ rawValue: String?) -> String {
        guard let validatedValue = rawValue else {
            return ""
        }
        return validatedValue
    }
}
