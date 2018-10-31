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
    var inputedString = InputView.receiveInput(ment:"초기입력")
    // 검사 후 틀리면 재실행
    var inputValidity = Validator.validate(rawCoordinate: inputedString)
    while inputValidity != nil {
        inputValidity?.printMessage()
        inputedString = InputView.receiveInput(ment:"초기입력")
        inputValidity = Validator.validate(rawCoordinate: inputedString)
    }
    // 검사를 통과한 값을 배열로 변환
    let inputedCoordinate = InputView.makeNumericArrayBy(rawInput: inputedString).compactMap { $0 }
    // mypoint에 저장
    let myPoint = MyPoint(x: inputedCoordinate[0], y: inputedCoordinate[1])
    // 화면 초기화
    PrintView.eraseDisplay()
    // 좌표계 위에 포인트 출력
    PrintView.printOnCoordSystem(myPoint)
}

main()

