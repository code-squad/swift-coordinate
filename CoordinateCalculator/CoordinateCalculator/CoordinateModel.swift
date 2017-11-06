//
//  CoordinateModel.swift
//  CoordinateCalculator
//
//  Created by Mrlee on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation
typealias pointAndValue = (point: [MyPoint], value: Double?)
struct CoordinateModel {
    var userPoints: [MyPoint] = []
    var pointsInfo: PointsInfo = PointsInfo.point
    var trixInfo: pointAndValue = ([MyPoint()], 0.0)
    init() {}
    init(pointData: [MyPoint], info: PointsInfo, trixInfo: pointAndValue) {
        self.userPoints = pointData
        self.pointsInfo = info
        self.trixInfo = trixInfo
    }
}
