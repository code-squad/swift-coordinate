//
//  MyPoint.swift
//  CoordinateCalculator
//
//  Created by 윤동민 on 2018. 10. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyPoint : Shape{
    var points : [Position] = []

    init(_ pointA: Position){
        points.append(pointA)
    }
}
