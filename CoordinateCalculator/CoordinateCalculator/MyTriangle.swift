//
//  MyTriangle.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 25/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyTriagnle : Shape {
    private(set) var lineAB : MyLine
    private(set) var lineBC : MyLine
    private(set) var lineCA : MyLine
    
    init(_ pointA: MyPoint, _ pointB: MyPoint, _ pointC: MyPoint){
        self.lineAB = MyLine(pointA, pointB)
        self.lineBC = MyLine(pointB, pointC)
        self.lineCA = MyLine(pointC, pointA)
    }
    
    func getPoint() -> [MyPoint] {
        return [lineAB.pointA, lineAB.pointB, lineCA.pointA]
    }
}
