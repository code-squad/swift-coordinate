//
//  CoordinateModel.swift
//  CoordinateCalculator
//
//  Created by Mrlee on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation
final class CoordinateModel {
    var generatrix: Generatrixs
    var points: [MyPoint]
    var resultOfGeneratix: Double?
    var inputCoordinateValue: String
    
    init() {
        self.generatrix = Generatrixs.point
        self.points = [MyPoint()]
        self.resultOfGeneratix = 0.0
        self.inputCoordinateValue = ""
    }
    
    subscript(index: Int) -> MyPoint{
       return points[index]
    }
}
