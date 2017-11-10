//
//  CoordinateModel.swift
//  CoordinateCalculator
//
//  Created by Mrlee on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation
final class CoordinateModel {
    private (set) var generatrix: Generatrixs
    private (set) var points: [MyPoint]
    private (set) var resultOfGeneratix: Double?
    private (set) var inputCoordinateValue: String
    
    init() {
        self.generatrix = Generatrixs.point
        self.points = [MyPoint()]
        self.resultOfGeneratix = 0.0
        self.inputCoordinateValue = ""
    }
    
    func insertGenaratrix(_ value: Generatrixs) {
        self.generatrix = value
    }
    
    func insertPoints(_ points: [MyPoint]) {
        self.points = points
    }
    
    func insertCoordinateValue(_ coordinateValue: String) {
        self.inputCoordinateValue = coordinateValue
    }
    
    func insertResultOfGeneratix(_ result: Double?) {
        self.resultOfGeneratix = result
    }
    
    subscript(index: Int) -> MyPoint{
       return points[index]
    }
}
