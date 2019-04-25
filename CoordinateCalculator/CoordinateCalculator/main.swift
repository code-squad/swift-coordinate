//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

enum ErrorCode : Error, CustomStringConvertible {
    case InvalidInput
    case InvalidRange
    case IsNotANumber
    case SplitStringError
    case Unknown
    var description: String{
        get {
            switch self {
            case .IsNotANumber:
                return "IsNotANumber Error"
            case .InvalidInput:
                return "InvalidInput Error"
            case .InvalidRange:
                return "InvalidRange Error"
            case .SplitStringError:
                return "SplitString Error"
            case .Unknown:
                return "Unknown Error"
            }
        }
    }
}



let main = {
    let inputView: InputView = InputView()
    var x: Int = 0
    var y: Int = 0
    while true {
        do {
            (x, y) = try inputView.readInput()
            break
        }catch let errorType as ErrorCode{
            print(errorType.description)
            continue
        }catch {
            print(ErrorCode.Unknown.description)
            continue
        }
    }
    let myPoint = MyPoint.init(x: x, y: y)
    OutputView.drawAxis()
    OutputView.drawPoint(myPoint)
}

main()

