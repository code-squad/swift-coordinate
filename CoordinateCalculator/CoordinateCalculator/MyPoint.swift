//
/******************************************************************************
 * File Name        : MyPoint.swift
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

struct MyPoint : Polygonable, Coodinatable, Equatable {
    
    private(set) var x = 0
    private(set) var y = 0
    
    init(_ x:Int = 0, _ y:Int = 0) {
        self.x = x
        self.y = y
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return ((lhs.x == rhs.x) && (lhs.y == rhs.y))
    }
    
    func draw(outView: OutputView) {
        outView.drawAxis()
        outView.draw(with: self)
        outView.finishingOperation()
    }
    
    func calculateArea() -> Double? {
        return nil
    }
    
    func printResult(outView: OutputView, area: Double?) {
    }
    
}





