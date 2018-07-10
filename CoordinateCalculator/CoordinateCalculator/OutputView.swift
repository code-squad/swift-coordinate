//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 이건희 on 2018. 7. 8..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
public struct OutputView{
    static func drawAxis(){
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
        print("\(ANSICode.text.magentaBright)\(ANSICode.points.draw())")
        print("\(ANSICode.text.normal)")
        print("\(ANSICode.cursor.move(row:ANSICode.axis.AxisLimit+2, col: 1))")
    }
}
