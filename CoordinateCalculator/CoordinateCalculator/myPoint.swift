//
//  coordinateCalculator.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 2018. 10. 18..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint {
    private var point = [Int]()
    private var x = 0
    private var y = 0
    
    init(initialValue: String) {
        let point = convertToPoint(initialValue)
        self.x = point[0] ?? -1
        self.y = point[1] ?? -1
    }
    
    private func convertToPoint(_ initialValue: String) -> [Int?] {
        return initialValue.trimmingCharacters(in: ["(",")"]).split(separator: ",").map({Int($0) ?? -1})
    }
}
