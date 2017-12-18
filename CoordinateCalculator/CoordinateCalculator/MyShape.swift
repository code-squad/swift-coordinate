//
//  MyShape.swift
//  CoordinateCalculator
//
//  Created by jack on 2017. 12. 14..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

protocol MyShape {
    func generateCoordinate() -> [MyPoint]
}

protocol canCalculate {
    func calculateShape() -> Double
    func messageOfShape() -> String
}
