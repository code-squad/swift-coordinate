//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 이건희 on 2018. 7. 12..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
public struct MyPoint : MyDraw {
    var x:Int = 0;
    var y:Int = 0;
    public func draw() -> String {
        return "\(ANSICode.cursor.move(row:axis.AxisLimit - y + 1, col: x * 2 + 3))@"
    }
}
