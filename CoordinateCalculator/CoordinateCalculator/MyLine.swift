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
    
    private var pointA = MyPoint(0, 0)
    private var pointB = MyPoint(0, 0)
    
    init(pointA: MyPoint, pointB: MyPoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
    
    func draw(outView: OutputView) {
        outView.drawAxis()
        outView.draw(with: self.pointA)
        outView.draw(with: self.pointB)
        outView.finishingOperation()
    }
    
    func calculateArea() -> Double? {
        return sqrt(pow((Double(pointA.x) - Double(pointB.x)), 2) +
                    pow((Double(pointA.y) - Double(pointB.y)), 2))
    }
     
    func printResult(outView: OutputView, area: Double?) {
        if let area = area {
            print("두 점 사이 거리는 \(area)")
        }
    }
}
