//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by 이동건 on 24/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: Over1DFigureProtocol {
    private var startPoint: MyPoint
    private var endPoint: MyPoint
    
    var descriptionPrefix: String {
        return "두 점 사이의 거리는"
    }
    
    var points: [MyPoint] {
        return [startPoint, endPoint]
    }
    
    var valueOfFigure: Double {
        return sqrt(pow(Double(startPoint.x - endPoint.x), 2) + pow(Double(startPoint.y - endPoint.y), 2))
    }
    
    init(startPoint: MyPoint, endPoint: MyPoint) {
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
}
