//
//  RectValidator.swift
//  CoordinateCalculator
//
//  Created by 이진영 on 07/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum CoordinateSystem {
    case x
    case y
}

struct RectVerifier {
    static func verifyRect(points: [MyPoint]) throws -> (origin: MyPoint, size: CGSize) {
        guard verifyCoordinates(points: points) else {
            throw InputError.invalidInput
        }
        
        let xStorage = initStorage(coordinateSystemValue: .x, points: points)
        let yStorage = initStorage(coordinateSystemValue: .y, points: points)
        
        guard verifyStorage(xStorage), verifyStorage(yStorage) else {
            throw InputError.invalidInput
        }
        
        let xInformation = extractRectInformation(storage: xStorage)
        let yInformation = extractRectInformation(storage: yStorage)
        
        let origin = MyPoint(x: xInformation.point, y: yInformation.point)
        let size = CGSize(width: xInformation.size, height: yInformation.size)
        
        return (origin, size)
    }
    
    ///똑같은 좌표가 2개 이상 입력되었는지 검증
    private static func verifyCoordinates(points: [MyPoint]) -> Bool {
        for i in 1..<points.count {
            if (points[0].x == points[i].x), (points[0].y == points[i].y) {
                return false
            }
        }
        
        return true
    }
    
    private static func initStorage(coordinateSystemValue: CoordinateSystem, points: [MyPoint]) -> [Int : Int] {
        var storage: [Int : Int] = [:]
        
        for point in points {
            let coordinate = coordinateSystemValue == .x ? point.x : point.y
            
            if let count = storage[coordinate] {
                storage[coordinate] = count + 1
            } else {
                storage[coordinate] = 1
            }
        }
        
        return storage
    }
    
    private static func verifyStorage(_ storage: [Int : Int]) -> Bool {
        if storage.count > 2 {
            return false
        }
        
        for (_, value) in storage {
            if value > 2 {
                return false
            }
        }
        
        return true
    }
    
    private static func extractRectInformation(storage: [Int : Int]) -> (point: Int, size: Int) {
        var point = Int.max
        var size = 0
        
        for (key, _) in storage {
            if point > key {
                point = key
            }
            
            if size < key {
                size = key
            }
        }
        
        size = size - point
        
        return (point, size)
    }
}
