//
//  CoordinateProcesser.swift
//  CoordinateCalculator
//
//  Created by 이동영 on 30/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct CoordinateProcesser {
    
    
    private let factory:FigureFactory = FigureFactory()
    
    private func check(point:PointTuple) throws{
        let possibleRange = 0...ANSICode.axis.AxisLimit
        guard possibleRange.contains(point.x) && possibleRange.contains(point.y) else {
            throw Exception.ErrorType.outOfRange
        }
    }
    
    private func check(answer:Answer) throws{
        guard answer.isCoordinateFormat() else {
            throw Exception.ErrorType.wrongFormat
        }
        _ = try answer.getPointTuples().map{
            pointTuple in
            try check(point:pointTuple)
        }
    }
    
    func convertToFigure(answer:Answer) throws -> Figure{
        try check(answer:answer)
        return try factory.createFigure(points: answer.getPointTuples())
    } 
}
