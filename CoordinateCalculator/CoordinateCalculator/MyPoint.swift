//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by Eunjin Kim on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint: MyShape {
    var type: OutputView.Figure
    private(set) var x = 0
    private(set) var y = 0
    init(x: Int, y: Int) {
        self.type = OutputView.Figure.point
        self.x = x
        self.y = y
    }
    
    func calculateOfPosition() -> String {
        return "\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - y, col: (x * 2) + 3))\(ANSICode.text.dot)"
    }

}
