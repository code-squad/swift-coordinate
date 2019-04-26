//
//  Convertor.swift
//  CoordinateCalculator
//
//  Created by cushy k on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

extension String {
    var toInt: Int {
        return Int(self.trimmingCharacters(in: .whitespaces)) ?? 0
    }
}

struct Convertor {

    private let origin: String

    init(origin: String) {
        self.origin = origin
    }

    func proccessedPoints() -> [String] {
        let points = splitComma(from: origin)
        return points
    }

    private func splitComma(from text: String) -> [String] {
        let points = remove(bracket: text).split(separator: ",").map { String($0) }
        return points
    }

    private func remove(bracket: String ) -> String {
        let result = bracket.components(separatedBy: ["(", ")"]).joined().trimmingCharacters(in: .whitespaces)
        return result
    }


}

