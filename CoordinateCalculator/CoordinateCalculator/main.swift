//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    // 처음 값 받음
    var inputedCoordinate = InputView.readInput()
    // 검사 후 틀리면 재실행
    var inputValidity = Validator.checkInputValidity(numberInput: inputedCoordinate)
    while inputValidity != Validity.valid {
        inputValidity.printMessage()
        inputedCoordinate = InputView.readInput()
        inputValidity = Validator.checkInputValidity(numberInput: inputedCoordinate)
    }
    // mypoint에 저장
    let myPoint = MyPoint(x: inputedCoordinate[0], y: inputedCoordinate[1])
    PrintView.eraseDisplay()
    PrintView.drawCoordinate(point: myPoint)
}

main()

