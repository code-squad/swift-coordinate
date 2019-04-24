//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by jang gukjin on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine {
    private(set) var startPoint = MyPoint(x: 0, y: 0)
    private(set) var endPoint = MyPoint(x: 0, y: 0)
    
    init(startPoint: MyPoint, endPoint: MyPoint){
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    func lengthCalculator(startPoint : MyPoint, endPoint : MyPoint) -> Double {
        let betweenLength = sqrt(pow(abs(Double(startPoint.x - endPoint.x)),2) + pow(abs(Double(startPoint.y - endPoint.y)),2))
        return betweenLength
    }
}
