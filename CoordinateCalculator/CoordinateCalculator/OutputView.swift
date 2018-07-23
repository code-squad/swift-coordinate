//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 23/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView {
    
    private static func clear(){
        print("\(ANSICode.clear)\(ANSICode.home)")
    }
    
    static func drawAxis(with point: MyPoint) {
        clear()
        print("\(ANSICode.text.redBright)")
        print("\(ANSICode.axis.drawPoint(point))")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
}
