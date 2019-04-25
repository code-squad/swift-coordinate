//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

enum ErrorCode : Error {
    case InvalidInput
    case InvalidRange
    case IsNotANumber
    case SplitStringError
}

let main = {
    let inputView: InputView = InputView()
    var x: Int = 0
    var y: Int = 0
    while true {
        do {
            (x, y) = try inputView.readInput()
            break
        }catch ErrorCode.InvalidInput{
            print("invalidInput")
            continue
        }catch ErrorCode.IsNotANumber{
            print("isNotANumber")
            continue
        }catch ErrorCode.InvalidRange{
            print("invalidRange")
            continue
        }catch ErrorCode.SplitStringError{
            print("splitStringError")
            continue
        }catch {
            print("unexpected error")
            continue
        }
    }
    let myPoint = MyPoint.init(x: x, y: y)
    OutputView.drawAxis()
    OutputView.drawPoint(myPoint)
}

main()

