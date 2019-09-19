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
}

extension MyPoint {
    init?(coordinates: String) {
        let userInput = coordinates.trimmingCharacters(in: ["(",")"]).components(separatedBy: ",")
        guard let x = userInput.first, let y = userInput.last,
                let coordinateX = Int(x), let coordinateY = Int(y) else {
            return nil
        }
        self.x = (coordinateX + CoordinateConstants.xAxisStartPos) * CoordinateConstants.coordinatesMagnifyingFactor.x
        self.y = CoordinateConstants.yAxisEndPos - (coordinateY * CoordinateConstants.coordinatesMagnifyingFactor.y)
    }
}
