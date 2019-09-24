//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by junwoo on 2019/09/23.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    static func printResult(point: MyPoint, emoji: String) {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.point.draw(point: point, emoji: emoji))")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static func printResult(line: MyLine, emoji: String) {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.line.draw(line: line, emoji: emoji))")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static func printResult(triangle: MyTriangle, emoji: String) {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.triangle.draw(triangle: triangle, emoji: emoji))")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
}
