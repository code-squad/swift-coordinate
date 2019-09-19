//
//  CoordinateOutputView.swift
//  CoordinateCalculator
//
//  Created by sungchan.you on 2019/09/20.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordinateOutputView {
    let coordinates: [MyPoint]
    
    func printCoordinates() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        coordinates.forEach {
            print("\(ANSICode.cursor.move(row:$0.y, col: $0.x))*")
        }
        print("\(ANSICode.text.redBright)\(ANSICode.axis.draw())")
    }
}
