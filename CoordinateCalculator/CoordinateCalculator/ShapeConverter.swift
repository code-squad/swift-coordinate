//
//  ShapeConverter.swift
//  CoordinateCalculator
//
//  Created by BLU on 2019. 5. 9..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ShapeConverter {
    private let numberParser: NumberParser
    private let validator: Validator
    
    init(numberParser: NumberParser, validator: Validator) {
        self.numberParser = numberParser
        self.validator = validator
    }
    
    enum ConvertError: Error {
        case exceedNumberOfCoordinates
        case verifyShapeFailed
        case createShapeFailed
        
        var localizedDescription: String {
            switch self {
            case .exceedNumberOfCoordinates:
                return "좌표 갯수를 초과하였습니다."
            case .verifyShapeFailed:
                return "도형 검증에 실패하였습니다."
            case .createShapeFailed:
                return "도형 생성에 실패하였습니다."
            }
        }
    }
    
    private func makePoint(from coordinate: String) throws -> MyPoint {
        try validator.isValid(coordinate)
        let numbers = try numberParser.parse(coordinate)
        if let point = MyPoint(x: numbers[0], y: numbers[1]) {
            return point
        }
        throw ShapeConverter.ConvertError.createShapeFailed
    }
    
    private func makeLine(from pointA: MyPoint, to pointB: MyPoint) throws -> MyLine {
        if let line = MyLine(pointA: pointA, pointB: pointB) {
            return line
        }
        throw ShapeConverter.ConvertError.createShapeFailed
    }
    
    private func makeTriangle(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) throws -> MyTriangle {
        guard isTriangle(pointA: pointA, pointB: pointB, pointC: pointC) else {
            throw ShapeConverter.ConvertError.verifyShapeFailed
        }
        if let triangle = MyTriangle(pointA: pointA, pointB: pointB, pointC: pointC) {
            return triangle
        }
        throw ShapeConverter.ConvertError.createShapeFailed
    }
    
    private func makeRect(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint, pointD: MyPoint) throws -> MyRect {
        let origin = min(pointA, pointB, pointC, pointD)
        let rightTop = max(pointA, pointB, pointC, pointD)
        let size = CGSize(width: rightTop.x - origin.x, height: rightTop.y - origin.y)
        guard isRect(pointA: pointA, pointB: pointB, pointC: pointC, pointD: pointD) else {
            throw ShapeConverter.ConvertError.verifyShapeFailed
        }
        if let rect = MyRect(origin: origin, size: size) {
            return rect
        }
        throw ShapeConverter.ConvertError.createShapeFailed
    }
    
    private func isTriangle(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint) -> Bool {
        let slopeOfPointAB = Double(pointB.y - pointA.y) / Double(pointB.x - pointA.x)
        let slopeOfPointBC = Double(pointC.y - pointB.y) / Double(pointC.x - pointB.x)
        return slopeOfPointAB != slopeOfPointBC
    }
    
    private func isRect(pointA: MyPoint, pointB: MyPoint, pointC: MyPoint, pointD: MyPoint) -> Bool {
        let points = [pointA, pointB, pointC, pointD]
        var pointXSet = Set<Int>()
        var pointYSet = Set<Int>()
        for point in points {
            pointXSet.insert(point.x)
            pointYSet.insert(point.y)
        }
        return pointXSet.count == 2 && pointYSet.count == 2
    }
    
    func makeShape(from coordinates: [String]) throws -> Shape {
        let points = try coordinates.map { try makePoint(from: $0) }
        switch coordinates.count {
        case 1:
            return points[0]
        case 2:
            return try makeLine(from: points[0], to: points[1])
        case 3:
            return try makeTriangle(pointA: points[0], pointB: points[1], pointC: points[2])
        case 4:
            return try makeRect(pointA: points[0], pointB: points[1], pointC: points[2], pointD: points[3])
        default:
            throw ShapeConverter.ConvertError.exceedNumberOfCoordinates
        }
    }
}
