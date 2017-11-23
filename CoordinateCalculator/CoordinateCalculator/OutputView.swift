//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 16..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView{

    func drawClear () {
        print("\(ANSICode.clear)\(ANSICode.home)")
    }

    //[MyPoint]를 파라미터로 받고 for문안에서 프린트
    func drawPoint (_ point: MyPoint) {
        print("\(ANSICode.text.redBright)\(ANSICode.cursor.move(row: 25 - point.y, col: (point.x * 2) + 3))\(ANSICode.text.dot)")
    }
    
    func drawAxis () {
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
    }
    
}
