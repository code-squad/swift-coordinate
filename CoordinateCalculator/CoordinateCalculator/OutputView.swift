//
/******************************************************************************
 * File Name        : OutputView.swift
 * Description      : CoordinateCalculator
 *******************************************************************************
 * Copyright (c) 2002-2019 KineMaster Corp. All rights reserved.
 * https://www.kinemastercorp.com/
 *
 * THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
 * KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
 * PURPOSE.
 ******************************************************************************/

import Foundation


struct OutputView {
    
    func drawAxis() {
        print("\(ANSICode.clear)\(ANSICode.home)")
        print("\(ANSICode.text.blueBright)\(ANSICode.axis.draw())")
    }

    func draw(with point: Coodinatable) {
        let convertedPoint = point.convertToCoodinate()
        var result = ANSICode.cursor.move(row: convertedPoint.y, col: convertedPoint.x)
        result += "🔸"
        print(result)
    }
    
    func finishingOperation() {
        print("\(ANSICode.cursor.move(row: ANSICode.axis.AxisLimit+2, col: ANSICode.axis.AxisLimit+2))")
    }
}
