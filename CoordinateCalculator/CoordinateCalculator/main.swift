//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation
repeat{
    let read = InputView.readInput()
    do{
        try InputView.checkInput(input: read)
            if read.lowercased() == "r"{
                break;
            }
        let data : [Int]
        try data = InputView.parseInput(input: read)
        try InputView.checkData(data: data)
        ANSICode.points.add(p: ANSICode.MyPoint(x: data[0], y: data[1]))
    } catch InputView.InputError.empty{
        InputView.printErr(errType: InputView.InputError.empty)
        continue
    } catch InputView.InputError.not2D {
        InputView.printErr(errType: InputView.InputError.not2D)
        continue
    } catch InputView.InputError.notInt{
        InputView.printErr(errType: InputView.InputError.notInt)
        continue
    } catch InputView.InputError.outRange{
        InputView.printErr(errType: InputView.InputError.outRange)
        continue
    }
}while(true)

OutputView.drawAxis();
