//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by rhino Q on 2018. 3. 22..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine:Shape, Resultable {
    private(set) var points: [MyPoint] = []
    private var pointFirst:MyPoint
    private var pointSecond:MyPoint
    
    init(_ pointFirst:MyPoint, _ pointSecond:MyPoint){
        self.pointFirst = pointFirst
        self.pointSecond = pointSecond
        points = [pointFirst,pointSecond]
    }
    
    func result() -> String {
        return " 두 점 사이의 거리는 \(calculateResult())"
    }
    
    private func calculateResult() -> Double {
        return sqrt(pow(Double(pointFirst.x - pointSecond.x), 2) + pow(Double(pointFirst.y - pointSecond.y), 2))
    }
}
