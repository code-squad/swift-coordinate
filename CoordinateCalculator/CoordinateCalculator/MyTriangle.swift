//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by 조재흥 on 26/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriangle {
    private let lineAB : MyLine
    private let lineBC : MyLine
    private let lineAC : MyLine
    
    init(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) {
        self.lineAB = .init(pointA, pointB)
        self.lineBC = .init(pointB, pointC)
        self.lineAC = .init(pointA, pointC)
    }
    
    
}
