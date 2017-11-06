//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func executeCoordinatesCalculator() {
    var inputView = InputView()
    var outputView = OutputView()
    var userPoints = [MyPoint()]
    var userPointsValue: PointsInfo
    var checkError = false
    while !checkError {
        do {
            try inputView.readInput()
            userPointsValue = inputView.countPointsValue()
            userPoints = try inputView.extract()
            outputView.draw(point: sortAndMakePoints(userPoints, userPointsValue))
            checkError = true
        } catch InputViewError.invalidPoint {
            checkError = false
        } catch InputViewError.invalidCharacterSet {
            checkError = false
        } catch {
            checkError = false
        }
    }
}

func sortAndMakePoints(_ points: [MyPoint], _ pointsValue: PointsInfo) -> [MyPoint] {
    switch pointsValue{
    case .point:
        return points
    case .line:
        let line = MyLine(pointA: points[0], pointB: points[1])
        return points
    }
}

executeCoordinatesCalculator()
