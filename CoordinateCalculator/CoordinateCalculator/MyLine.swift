//
//  MyLine.swift
//  CoordinateCalculator
//
//  Created by Elena on 02/11/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//


import Foundation

struct MyLine: pointProtocol, twoPointProtocol {
    var points: [MyPoint]
    
    var pointsForPosition: [MyPoint] {
        return [points[0], points[1]]
    }
    
    var resultDescription: String {
        return "두 점 사이의 거리는 \(sqrt(pow(Double(points[0].x - points[1].x), 2) + pow(Double(points[0].y - points[1].y), 2)))"
    }
    
    init?(points: [MyPoint?]) {
        
        guard let point : [MyPoint] = points as? [MyPoint] else {
            return nil
        }
        self.points = point
    }
}

