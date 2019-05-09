//
//  PointFormatter.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 9..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct PointFormatter {
    
    static private func isValid(_ input: String) -> Bool {
        let pattern = "\\([0-9]+,[0-9]+\\)"
        return input.matches(pattern)
    }
    
    static func convert(from input: String) -> MyPoint? {
        guard isValid(input) else {
            return nil
        }
        let trimmed = input.trimmingCharacters(in: ["(", ")"])
        let coordinates = trimmed.components(separatedBy: ",").map { Int($0) ?? 0 }
        return MyPoint(x: coordinates[0], y: coordinates[1])
    }
}
