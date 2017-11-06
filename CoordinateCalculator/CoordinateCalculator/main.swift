//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func sortAndMakePoints(_ points: [MyPoint], _ pointsValue: PointsInfo) -> pointAndValue {
    switch pointsValue{
    case .point:
        return (points, nil)
    case .line:
        let line = MyLine(pointA: points[0], pointB: points[1])
        let lineDistance = line.calcurateDistanceTwoPoints()
        return (points, lineDistance)
    }
}

func executeCoordinatesCalculator() {
    var inputView = InputView()
    let outputView = OutputView()
    var userPoints = [MyPoint()]
    var pointsValue: PointsInfo
    var pointAndValue: (point: [MyPoint], value: Double?)
    var coordinateInfo = CoordinateModel()
    var checkError = false
    
    while !checkError {
        do {
            try inputView.readInput()
            pointsValue = inputView.countPointsValue()
            userPoints = try inputView.extract()
            pointAndValue = sortAndMakePoints(userPoints, pointsValue)
            coordinateInfo = CoordinateModel(pointData: userPoints, info: pointsValue, trixInfo: pointAndValue)
            outputView.draw(coordinateInfo)
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

executeCoordinatesCalculator()
