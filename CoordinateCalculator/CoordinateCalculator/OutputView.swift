//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by jang gukjin on 17/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView{
    func drawAxis(myLine : MyLine) {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.blueBright)\(ANSICode.axis.draw())")
        print("\(ANSICode.cursor.move(row: 25-myLine.pointA.y, col: (myLine.pointA.x*2)+2))*")
        print("\(ANSICode.cursor.move(row: 25-myLine.pointB.y, col: (myLine.pointB.x*2)+2))*")
        print("\(ANSICode.cursor.move(row: 27, col: 25))")
    }
}
