//
//  CoordinateCalculator.swift
//  CoordinateCalculator
//
//  Created by 김성현 on 23/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordinateCalculator {
    
    static func shaped(points: [Point]) throws -> Drawable {
        switch points.count {
        case 1:
            return points[0]
        case 2:
            return Line(start: points[0], end: points[1])
        case 3:
            return Triangle(pointA: points[0], pointB: points[1], pointC: points[2])
        case 4:
            return try rectangle(points: points)
        default:
            throw CoordinateError.shapeNotSupported
        }
    }
    
    static func rectangle(points: [Point]) throws -> Rectangle {
        var maxX = points[0].x
        var minX = points[0].x
        var maxY = points[0].y
        var minY = points[0].y
        
        for point in points {
            
            if maxX < point.x {
                maxX = point.x
            } else if minX > point.x {
                minX = point.x
            }
            
            if maxY < point.y {
                maxY = point.y
            } else if minY > point.y {
                minY = point.y
            }
            
        }
        guard points.contains(Point(x: maxX, y: maxY)),
            points.contains(Point(x: maxX, y: minY)),
            points.contains(Point(x: minX, y: maxY)),
            points.contains(Point(x: minX, y: minY)) else {
                throw CoordinateError.cannotRecognizeRectangle
        }
        return Rectangle(origin: Point(x: minX, y: maxY), size: CGSize(width: maxX - minX, height: maxY - minY))
    }
    
}

enum CoordinateError: Error, CustomStringConvertible {
    
    case shapeNotSupported
    case cannotRecognizeRectangle
    
    var description: String {
        switch self {
        case .shapeNotSupported:
            return "지원되지 않는 도형입니다."
        case .cannotRecognizeRectangle:
            return "직사각형을 인식할 수 없습니다."
        }
    }
    
}
