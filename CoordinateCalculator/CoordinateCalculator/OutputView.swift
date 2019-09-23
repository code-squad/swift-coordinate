//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by junwoo on 2019/09/23.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    static func printResult(point: MyPoint) {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.Point.draw(point: point, emoji: "*"))")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
    static func printResult(line: MyLine) {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.Point.draw(point: line.pointA, emoji: "*"))")
        print("\(ANSICode.Point.draw(point: line.pointB, emoji: "*"))")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
        print("두 점 사이 거리는 \(LineConverter.convert(line) ?? 0)")
    }
}
