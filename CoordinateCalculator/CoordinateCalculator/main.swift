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
        switch points.count{
        case 2:
            OutputView.drawLine(line: MyLine(pointA: points[0], pointB: points[1]))
            break
        case 3:
            OutputView.drawTriangle(triangle: MyTriangle(pointA: points[0], pointB: points[1], pointC: points[2]))
            break
        case 4:
            let rect = try MyRect(pointA: points[0], pointB: points[1], pointC: points[2], PointD: points[3])
            OutputView.drawRect(rect: rect)
            break
        default:
            break
        }
        OutputView.drawAxis();
    }catch {
        InputView.printErr(errType: error as! StaticData.InputError)
        OutputView.clear()
        continue
    }
}while(true)
