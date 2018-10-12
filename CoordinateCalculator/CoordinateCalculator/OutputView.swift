//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 2018. 10. 11..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    static func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
}
