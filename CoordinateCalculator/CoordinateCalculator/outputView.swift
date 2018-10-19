//
//  outputView.swift
//  CoordinateCalculator
//
//  Created by 김장수 on 2018. 10. 16..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    var point: MyPoint
    
    init(point: MyPoint) {
        self.point = point
    }
    
    public func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.axis.draw())\(ANSICode.text.whiteBright)")
//        print("\(ANSICode.cursor.move(row: 24 - point[1], col: 2*point[0] + 3))", terminator: markPoint())
    }
    
    private func markPoint() -> String {
        return "\(ANSICode.text.yellowBright)"
    }
}
