//
//  CoordinatePlane.swift
//  CoordinateCalculator
//
//  Created by 김성현 on 20/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordinatePlane {
    
    let coordinateView = CoordinateView()
    
    var minX = 0
    var maxX = ANSICode.CoordinateGrid.gridLimit
    var minY = 0
    var maxY = ANSICode.CoordinateGrid.gridLimit
    
    var points = [Point]()
    var shapes = [Shape]()
    
    mutating func add(point: Point) throws {
        guard planeCanContain(point: point) else {
            throw CoordinatePlaneError.axisLimitExceeded
        }
        points.append(point)
        coordinateView.draw(point: point)
    }
    
    mutating func add(shape: Shape) {
        shapes.append(shape)
    }
    
    private func planeCanContain(point: Point) -> Bool {
        if point.x < minX ||
            point.x > maxX ||
            point.y < minY ||
            point.y > maxY {
            return false
        }
        return true
    }
    
    
    
}


enum CoordinatePlaneError: CoordinateError {
    case axisLimitExceeded
    
    func description() -> String {
        switch self {
        case .axisLimitExceeded:
            return "좌표축 제한 초과함"
        }
    }
}
