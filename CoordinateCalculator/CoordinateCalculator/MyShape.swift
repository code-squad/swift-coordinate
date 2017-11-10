//
//  MyShape.swift
//  CoordinateCalculator
//
//  Created by Eunjin Kim on 2017. 11. 10..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

protocol MyShape {
    var type: Figure
    init(x: Int, y: Int)
    init(pointA: MyPoint, pointB: MyPoint)
    
    func getType()
    func setType()
}
