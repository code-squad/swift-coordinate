//
//  CoordinateTrixCalculater.swift
//  CoordinateCalculator
//
//  Created by Mrlee on 2017. 11. 7..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Calculator {
    func sortAndMakePoints(_ coordinateModel: CoordinateModel) {
        switch coordinateModel.pointsKind{
        case .point:
            coordinateModel.pointsKind = .point
        case .line:
            let line = MyLine(pointA: coordinateModel.trixInfo.point[0], pointB: coordinateModel.trixInfo.point[1])
            let lineDistance = line.calcurateDistanceTwoPoints()
            coordinateModel.trixInfo.value = lineDistance
        }
    }
}
