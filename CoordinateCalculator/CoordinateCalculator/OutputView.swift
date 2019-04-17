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
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.yellow)\(quadrantOne)")
    }
}
