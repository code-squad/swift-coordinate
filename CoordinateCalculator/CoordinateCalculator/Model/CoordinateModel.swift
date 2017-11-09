//
//  CoordinateModel.swift
//  CoordinateCalculator
//
//  Created by Mrlee on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation
final class CoordinateModel {
    typealias PointsAndParticularResult = (point: [MyPoint], value: Double?)
    var generatrix: Generatrixs
    var pointsAndResult: PointsAndParticularResult
    var inputCoordinateValue: String
    
    init() {
        self.generatrix = Generatrixs.point
        self.pointsAndResult = ([MyPoint()], 0.0)
        self.inputCoordinateValue = ""
    }
    
    subscript(index: Int) -> MyPoint{
       return pointsAndResult.point[index]
    }
}
