//
/******************************************************************************
 * File Name        : MyLine.swift
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

struct MyLine: Polygonable {
    
    var pointA = MyPoint(0, 0)
    var pointB = MyPoint(0, 0)
    
    func draw(outView: OutputView) {
        outView.drawAxis()
        outView.draw(with: self.pointA)
        outView.draw(with: self.pointB)
        outView.finishingOperation()
    }
    
    func calculateArea() -> Double? {
        return 0.0
    }
     
    func printResult(outView: OutputView, area: Double?) {
        if let area = area {
            print("두 점 사이 거리는 \(area)")
        }
    }
}
