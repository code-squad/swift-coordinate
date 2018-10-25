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
    var inputValidity = Validator.validate(rawCoordinate: inputedCoordinate)
    while inputValidity != Validity.valid {
        inputValidity.printMessage()
        inputedCoordinate = InputView.readInput()
        inputValidity = Validator.validate(rawCoordinate: inputedCoordinate)
    }
    // mypoint에 저장
    let myPoint = MyPoint(x: inputedCoordinate[0], y: inputedCoordinate[1])
    // 화면 초기화
    PrintView.eraseDisplay()
    // 좌표계 위에 포인트 출력
    PrintView.printOnCoordSystem(myPoint)
}

main()

