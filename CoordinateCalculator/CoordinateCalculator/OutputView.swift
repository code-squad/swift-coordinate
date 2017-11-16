//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 16..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView{
    func drawAxis () {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
}
