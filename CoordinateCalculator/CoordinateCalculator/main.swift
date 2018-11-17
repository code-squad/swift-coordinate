//
//  main.swift
//  CoordinateCalculator
//
//  Created by Elena on 31/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

func coordinateStart() {
    var repetition = true
    var pointResult: String = ""
    var lineResult: String = ""
    while(repetition) {
        let point = InputView.getUserString()
        //- 체크
        let coordinatesCount = InputView.checkHyphenCoordinate(point)
        //[point]
        let points = InputView.selectResult(point,coordinatesCount)
        
        for i in 0..<points.count {
            if points[i] == nil {
                break
            }
            repetition = false
            pointResult += OutputView().resultPoint(inputPoints: points[i] ?? MyPoint.init(x: 0, y: 0))
        }
        // Line
        if coordinatesCount == 2 {
            let line = MyLine.init(points: points)
            lineResult += OutputView().displayLine(line!)
        }
    }
    OutputView().drawPoint(pointResult)
    if lineResult != "" {
        OutputView().drawLine(pointResult,lineResult)
    }
    
    
}

coordinateStart()

