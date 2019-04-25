//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

enum errorCode : Error {
    case invalidInput
    case invalidRange
    case isNotANumber
    case splitStringError
}

let main = {
    let inputView: InputView = InputView()
    var x: Int = 0
    var y: Int = 0
    while true {
        do {
            (x, y) = try inputView.readInput()
            break
        }catch errorCode.invalidInput{
            print("invalidInput")
            continue
        }catch errorCode.isNotANumber{
            print("isNotANumber")
            continue
        }catch errorCode.invalidRange{
            print("invalidRange")
            continue
        }catch errorCode.splitStringError{
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

