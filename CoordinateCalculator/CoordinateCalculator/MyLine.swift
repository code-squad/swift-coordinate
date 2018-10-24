//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 23/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine : Shape{
    private(set) var pointA : MyPoint
    private(set) var pointB : MyPoint
    
    init(_ pointA: MyPoint, _ pointB: MyPoint){
        self.pointA = pointA
        self.pointB = pointB
    }
}
