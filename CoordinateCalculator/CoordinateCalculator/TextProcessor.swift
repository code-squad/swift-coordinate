//
//  TextProcessor.swift
//  CoordinateCalculator
//
//  Created by 윤지영 on 12/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

extension String {
    func splitByComma() -> [String] {
        return self.split(separator:",").map({String($0)})
    }
    func removeBothFirstAndLast() -> String {
        return String(self.dropFirst().dropLast())
    }
}

struct TextProcessor {
    static func extractXY(from coordinate:String) -> (x:Int, y:Int){
        let xy : [String] = coordinate.removeBothFirstAndLast().splitByComma()
        let x = Int(xy.first ?? "0") ?? 0
        let y = Int(xy.last ?? "0") ?? 0
        return (x, y)
    }
}
