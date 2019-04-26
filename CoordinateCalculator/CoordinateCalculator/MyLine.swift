//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by jang gukjin on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine : Figure {
    private(set) var startPoint = MyPoint(x: 0, y: 0)
    private(set) var endPoint = MyPoint(x: 0, y: 0)
    
    init(x: Int, y: Int) {
        self.startPoint = MyPoint(x: 0, y: 0)
        self.endPoint = MyPoint(x: 0, y: 0)
    }
    
    init(startPoint: MyPoint, endPoint: MyPoint){
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    func lengthCalculator() -> Double {
        let betweenLength = sqrt(pow(abs(Double(startPoint.x - endPoint.x)),2) + pow(abs(Double(startPoint.y - endPoint.y)),2))
        return round(betweenLength * 100) / 100
    }
    
    func distinctIndex() -> (locationIndex: Int, myPoints: [MyPoint], guideMent: String) {
        var linePoints : [MyPoint] = []
        linePoints.append(startPoint)
        linePoints.append(endPoint)
        let guideMent = "두점을 잇는 직선의 길이는 \(lengthCalculator()) 입니다."
        return (linePoints.count, linePoints, guideMent)
    }
}
