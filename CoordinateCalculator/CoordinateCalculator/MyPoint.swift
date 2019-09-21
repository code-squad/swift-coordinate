//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by sungchan.you on 2019/09/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: Equatable {
    var x = 0
    var y = 0
    
    init?(string: String) {
        let subStrings = string.trimmingCharacters(in: ["(",")"]).components(separatedBy: ",")
        guard subStrings.count == 2,
            let strX = subStrings.first,
            let strY = subStrings.last?.trimmingCharacters(in: .whitespacesAndNewlines),
            let x = Int(strX),
            let y = Int(strY) else {
                return nil
        }
        self.x = x
        self.y = y
    }
}

extension MyPoint: CoordinateConvertable {
    var coordinate: (row: Int, col: Int) {
        return ( CoordinateConstants.yAxisEndPos - (self.y * CoordinateConstants.coordinatesMagnifyingFactor.y),
                 (self.x + CoordinateConstants.xAxisStartPos) * CoordinateConstants.coordinatesMagnifyingFactor.x)
    }
}
