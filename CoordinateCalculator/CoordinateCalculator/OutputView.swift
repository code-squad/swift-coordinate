//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 이희찬 on 15/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    static func drawAxis(_ point:MyPoint) {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
        draw(point)
    }
    
    private static func draw(_ point:MyPoint) {

        print("\(ANSICode.cursor.move(row: point.y, col: point.x))😼\(ANSICode.cursor.move(row: ANSICode.axis.AxisLimit+2, col: ANSICode.axis.AxisLimit+2))")
    
    }
    
}
