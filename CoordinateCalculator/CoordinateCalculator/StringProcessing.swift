//
//  StringProcessing.swift
//  CoordinateCalculator
//
//  Created by Elena on 04/12/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

extension String {
    func splitByComma() -> [String] {
        return self.split(separator: ",").map({String($0)})
    }
    func splitByHyphen() -> [String] {
        return self.split(separator: "-").map({String($0)})
    }
    func removeBothFirstAndLast() -> String {
        return String(self.dropFirst().dropLast())
    }
}

struct StringProcessing {
    static func dividePoint(from coordinate: String) -> MyPoint {
        let point: [String] = coordinate.removeBothFirstAndLast().splitByComma()
        let x = Int(point.first ?? "0") ?? 0
        let y = Int(point.last ?? "0") ?? 0
        return MyPoint(x: x, y: y)
    }
}
