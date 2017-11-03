//
//  InputView.swift
//  CoordinateCalculator
//
//  Created by TaeHyeonLee on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    private let pointInvalidationChecker = PointInvalidationChecker()
    func readInput() throws -> Points {
        let formula = readLine() ?? ""
        try pointInvalidationChecker.checkAvailableCharacterSet(formula: formula)
        let inputPoints = formula.split(separator: "-").map({String($0)})
        let points = try getPoints(inputPoints: inputPoints)
        try pointInvalidationChecker.checkPointInvalidation(points: points)
        return points
    }
    
    private func getPoints(inputPoints: [String]) throws -> Points {
        var points : Points = []
        for inputPoint in inputPoints {
            points.append(contentsOf: try getPoint(formula: inputPoint))
        }
        return points
    }
    
    private func getPoint(formula: String) throws -> Points {
        let point = try pointInvalidationChecker.checkInputValidation(formula: formula)
        let points : Points = [(x: Int(point[0])!, y: Int(point[1])!)]
        return points
    }
}


