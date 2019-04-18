//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by cushy k on 17/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {

    static func drawAxis() {
        let quadrantOne = ANSICode.axis.draw()
        formatScreen()
        print("\(ANSICode.text.yellow)\(quadrantOne)")
    }

    private static func formatScreen() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
}
