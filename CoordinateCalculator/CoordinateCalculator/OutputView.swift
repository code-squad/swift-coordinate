//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 23/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    static func drawAxis(){
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
}
