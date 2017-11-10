//
//  CoordinateModel.swift
//  CoordinateCalculator
//
//  Created by Mrlee on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordinateModel {
    private (set) var generatrix: Generatrixs
    private (set) var points: [MyPoint]
    private (set) var resultOfGeneratix: Double?
    
    init() {
        self.generatrix = Generatrixs.point
        self.points = [MyPoint()]
        self.resultOfGeneratix = 0.0
    }
    
    init(points: [MyPoint]) {
        self.init()
        self.points = points
    }
    
    init(trixValue: Generatrixs) {
        self.init()
        self.generatrix = trixValue
    }
    
    init(trixValue: Generatrixs, points: [MyPoint]) {
        self.init()
        self.generatrix = trixValue
        self.points = points
    }
    
    init(trixValue: Generatrixs, points: [MyPoint], typeResult: Double?) {
        self.init()
        self.generatrix = trixValue
        self.points = points
        self.resultOfGeneratix = typeResult
    }
    
    init(typeResult: Double?, model: CoordinateModel) {
        self.init(trixValue: model.generatrix, points: model.points, typeResult: model.resultOfGeneratix)
        self.resultOfGeneratix = typeResult
    }
    
    subscript(index: Int) -> MyPoint{
        return points[index]
    }
}
