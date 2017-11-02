//
//  FigureFactory.swift
//  CoordinateCalculator
//
//  Created by 심 승민 on 2017. 11. 2..
//

import Foundation

struct FigureFactory{
    enum Figures: Int{
        case point = 1
        case line = 2
        case triangle = 3
        case rect = 4
    }
    
    static func createFigure(from points: [MyPoint]) throws -> FigureCalculatable{
        switch points.count {
        case Figures.point.rawValue: return try MyPoint.makeOne(from: points)
        case Figures.line.rawValue: return try MyLine.makeOne(from: points)
        case Figures.triangle.rawValue: return try MyTriangle.makeOne(from: points)
        case Figures.rect.rawValue: return try MyRect.makeOne(from: points)
        default: return try MyPoint.makeOne(from: points)
        }
    }
}
