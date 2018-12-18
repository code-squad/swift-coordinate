//
//  main.swift
//  CoordinateCalculator
//
//  Created by Elena on 31/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

func coordinateStart() ->Bool{
    //입력
    let inputPoint = InputView.getUserString()
    //처리
    let shapeValue = inputPoint.splitByHyphen()
    var points = [MyPoint]()
    
    for coordinate in shapeValue {
        guard let point = MyShape.makePoint(from: coordinate) else { return true }
        points.append(point)
    }
    guard let shape = MyShape.generateShape(points) else { return true }
    // 출력
    OutputView().drawShape(shape)
    
    return false
}

var repetition = true
while(repetition) {
    repetition = coordinateStart()
}


