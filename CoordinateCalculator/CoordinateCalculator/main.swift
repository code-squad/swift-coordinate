//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

let main = {
    var pointList: [Pair] = [Pair]()
    while true {
        do {
            pointList = try InputView.readInput()
            break
        }catch let errorType as ErrorCode{
            print(errorType.description)
            continue
        }catch {
            print(ErrorCode.Unknown.description)
            continue
        }
    }
    let myShape = try MyShapeFactory.createShape(pointList: pointList)
    OutputView.drawAxis()
    OutputView.drawShape(myShape)
    try OutputView.displayShapeInformation(myShape)
}

try main()

