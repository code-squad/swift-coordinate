//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by oingbong on 2018. 7. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    private static func clear() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    public static func drawAxis() {
        clear()
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
}
