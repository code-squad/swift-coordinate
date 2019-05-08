//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 8..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    static func clear() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    static func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
}
