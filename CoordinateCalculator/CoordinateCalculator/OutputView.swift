//
//  OutputView.swift
//  CoordinateCalculator
//
//  Created by 이건희 on 2018. 7. 8..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
public struct OutputView{
    static var drawQueue = [MyDraw]()
    static func drawAxis(){
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.whiteBright)\(ANSICode.axis.draw())")
        print("\(ANSICode.text.magentaBright)")
        while drawQueue.count > 0 {
            let item = drawQueue.removeFirst();
            print(item.draw())
        }
        print("\(ANSICode.text.normal)")
        print("\(ANSICode.cursor.move(row:ANSICode.axis.AxisLimit+3, col: 0))")
    }
}
