//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation
mainloop : repeat{
    let points : [MyPoint], read : String
    do{
        try read = InputView.readInput()
        if read.lowercased() == "q"{
            break;
        }
        try points = InputView.parseInput(input: read)
        for point in points{
            OutputView.drawPoint(point: point)
        }
        let shape : MyShape?
        switch points.count{
        case 2:
            (shape = MyLine(pointA: points[0], pointB: points[1]))
            break
        case 3:
            (shape = MyTriangle(pointA: points[0], pointB: points[1], pointC: points[2]))
            break
        case 4:
            (shape = try MyRect(pointA: points[0], pointB: points[1], pointC: points[2], PointD: points[3]))
            break
        default:
            shape = nil
            break
        }
        if let shape = shape {(OutputView.drawShape(shape: shape))}
        OutputView.drawAxis();
    }catch let error as StaticData.InputError {
        InputView.printErr(errType: error)
        OutputView.clear()
        continue
    }
}while(true)
