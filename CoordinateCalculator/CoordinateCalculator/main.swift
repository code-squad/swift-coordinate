//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

print("Hello, Jake!!")

struct OutputView {
    static func drawAxis() {
        clearAxis()
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    static private func clearAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
}

OutputView.drawAxis()
