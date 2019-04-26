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
    case SplitCoordinatorError
    case Unknown
    case InvalidCharacter
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
            case .InvalidCharacter:
                return "Invalid characters Error"
            case .SplitCoordinatorError:
                return "Split Coordinator X From Y Error"
            case .Unknown:
                return "Unknown Error"
            }
        }
    }
}

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
    let myShape = MyShapeFactory.createShape(pointList: pointList)
    OutputView.drawAxis()
    OutputView.drawShape(myShape)
}

main()

