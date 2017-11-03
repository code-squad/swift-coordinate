//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by TaeHyeonLee on 2017. 11. 1..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle : Figure {
    private(set) var lineAB : MyLine
    private(set) var lineBC : MyLine
    private(set) var lineAC : MyLine
    private(set) var points : [MyPoint]
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = MyLine(pointA: pointA, pointB: pointB)
        self.lineBC = MyLine(pointA: pointB, pointB: pointC)
        self.lineAC = MyLine(pointA: pointA, pointB: pointC)
        self.points = [pointA, pointB, pointC]
    }
    
    func getArea() -> Double {
        return sqrt(Double(1) - pow((pow(self.lineBC.getDistance(), 2) + pow(self.lineAB.getDistance(), 2) - pow(self.lineAC.getDistance(), 2)) / (2 * self.lineBC.getDistance() * self.lineAB.getDistance()), 2)) * self.lineBC.getDistance() * self.lineAB.getDistance() / 2
    }
}
