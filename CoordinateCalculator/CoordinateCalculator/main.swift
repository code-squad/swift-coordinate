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
    } catch StaticData.InputError.empty{
        InputView.printErr(errType: StaticData.InputError.empty)
        continue
    } catch StaticData.InputError.not2D {
        InputView.printErr(errType: StaticData.InputError.not2D)
        continue
    } catch StaticData.InputError.notInt{
        InputView.printErr(errType: StaticData.InputError.notInt)
        continue
    } catch StaticData.InputError.outRange{
        InputView.printErr(errType: StaticData.InputError.outRange)
        continue
    } catch StaticData.InputError.notRectangle{
        InputView.printErr(errType: StaticData.InputError.notRectangle)
        continue
    }
}while(true)
