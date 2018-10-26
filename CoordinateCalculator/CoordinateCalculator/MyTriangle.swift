//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 26/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle : Figure {
    private let lineAB : MyLine
    private let lineBC : MyLine
    private let lineAC : MyLine
    
    private let pointA : MyPoint
    private let pointB : MyPoint
    private let pointC : MyPoint
    
    init(_ pointA: MyPoint, _ pointB: MyPoint, _ pointC: MyPoint) {
        self.lineAB = .init(pointA, pointB)
        self.lineBC = .init(pointB, pointC)
        self.lineAC = .init(pointA, pointC)
        
        self.pointA = pointA
        self.pointB = pointB
        self.pointC = pointC
    }
    
    
    
    func readPoints() -> [MyPoint] {
        return [self.pointA, self.pointB, self.pointC]
    }
}
