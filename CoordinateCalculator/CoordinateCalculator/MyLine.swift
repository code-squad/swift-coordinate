//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by jang gukjin on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine : Figure, Guide {
    private(set) var startPoint = MyPoint(x: 0, y: 0)
    private(set) var endPoint = MyPoint(x: 0, y: 0)
    
    init(startPoint: MyPoint, endPoint: MyPoint){
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    func lengthCalculator() -> Double {
        let betweenLength = sqrt(pow(abs(Double(startPoint.x - endPoint.x)),2) + pow(abs(Double(startPoint.y - endPoint.y)),2))
        return round(betweenLength * 100) / 100
    }
    
    func distinctIndex() -> (locationIndex: Int, myPoints: [MyPoint]) {
        var linePoints : [MyPoint] = []
        linePoints.append(startPoint)
        linePoints.append(endPoint)
        return (linePoints.count, linePoints)
    }
    
    func guidePrint()->(ment: String,value: Double) {
        let guideMent = (Ment: "두 점사이의 거리는", value:lengthCalculator())
        return (guideMent.Ment,guideMent.value)
    }
}
