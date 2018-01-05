//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 김수현 on 2018. 1. 5..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

public struct OutputView {

    func drawAxis() {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }

    func clearAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }

}
