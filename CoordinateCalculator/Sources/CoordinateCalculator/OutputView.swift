//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 10. 25..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView{
    static func drawAxis(){
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.axis.draw())")
    }
}
