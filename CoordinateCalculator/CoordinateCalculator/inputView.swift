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
        let coordinates = readLine()
        return validity(coordinates)
    }
    
    private func validity(_ coordinates: String?) -> String {
        guard let coordinates = coordinates else {
            return ""
        }
        return coordinates
    }
}
