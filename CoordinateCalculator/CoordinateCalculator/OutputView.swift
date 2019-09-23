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
}
