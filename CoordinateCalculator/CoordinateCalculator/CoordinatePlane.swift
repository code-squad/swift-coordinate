//
//  CoordinatePlane.swift
//  CoordinateCalculator
//
//  Created by 김성현 on 20/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordinatePlane {
    
    private var coordinateView: CoordinateView
    private var textView: TextView
    
    private var coordinateRange: ClosedRange<Int>
    
    private var points = [Point]()
    private var shapes = [Shape]()
    
    init() {
        coordinateView = CoordinateView()
        textView = TextView()
        coordinateRange = 0...ANSICode.CoordinateGrid.gridLimit
    }
    
    private mutating func add(_ point: Point) throws {
        
        try validateRange(point: point)
        
        points.append(point)
        coordinateView.draw(point: point)
    }
    
    private mutating func add(_ shape: Shape) throws {
        
        for point in shape.points {
            try validateRange(point: point)
        }
        
        shapes.append(shape)
        draw(shape: shape)
        textView.printText(shape.description())
    }
    
    private func shaping(points: [Point]) -> Shape? {
        switch points.count {
        case 2:
            return Line(start: points[0], end: points[1])
        default:
            return nil
        }
    }
    
    private mutating func addIdentifiedShape(points: [Point]) throws {
        if let shape = shaping(points: points) {
            try add(shape)
        } else {
            for point in points {
                try add(point)
            }
        }
    }
    
    
    
    private func draw(shape: Shape) {
        for point in shape.points {
            coordinateView.draw(point: point)
        }
    }
    
    
    /// Point가 좌표 크기 제한을 벗어나면 오류를 발생시킵니다.
    private func validateRange(point: Point) throws {
        guard coordinateRange.contains(point.x), coordinateRange.contains(point.y) else {
            throw CoordinatePlaneError.axisLimitExceeded
        }
    }
    
    mutating func readCoordinatesAndAdd() {
        
        do {
            let points = try textView.readCoordinates()
            try addIdentifiedShape(points: points)
        } catch let error as InputError {
            textView.printText("입력 오류: \(error.description())")
        } catch let error as CoordinatePlaneError {
            textView.printText("좌표 오류: \(error.description())")
        } catch {
            textView.printText("예상치 못한 오류: \(error)")
        }
        
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
