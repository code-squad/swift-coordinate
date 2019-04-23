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
    case invalidPair
    case splitPointError
}

//OutputView.drawAxis()

let inputView: InputView = InputView()

while true {
    do {
        let point = try inputView.readInput()
        print(point)
        break
    }catch errorCode.invalidInput{
        print("invalidInput")
        continue
    }catch errorCode.splitPointError{
        print("splitPointError")
        continue
    }catch errorCode.isNotANumber{
        print("isNotANumber")
        continue
    }catch errorCode.invalidRange{
        print("invalidRange")
        continue
    }catch {
        print("unexpected error")
        continue
    }
}
