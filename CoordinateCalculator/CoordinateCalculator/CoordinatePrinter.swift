//
//  CoordinatePrinter.swift
//  CoordinateCalculator
//
//  Created by RENO1 on 23/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordinatePrinter {
    private var point:MyPoint
    
    init(initPoint:MyPoint) {
        self.point = initPoint
    }
    
    func printPoint() {
        print(self.point.toString())
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.cursor.move(point: self.point))⭐️")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
}

extension ANSICode.cursor {
    static func move(point:MyPoint) -> String {
        let syncX = point.x * 2 + 2
        let syncY = 25 - point.y
        return ANSICode.cursor.move(row: syncY, col: syncX)
    }
}
