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
    var inputedString = InputView.receiveInput(ment:"\(ANSICode.text.white)좌표를 입력하세요 (x,y)")
    // 검사 후 틀리면 재실행
    var inputValidity = Validator.validate(rawCoordinate: inputedString)
    while inputValidity != nil {
        inputedString = InputView.receiveInput(ment:"\(ANSICode.text.white)좌표를 입력하세요 (x,y)")
        inputValidity = Validator.validate(rawCoordinate: inputedString)
    }
    // 검사를 통과한 값을 배열로 변환
    let inputedCoordinates = CoordGenerator.makeNumericArrayBy(rawInput: inputedString).compactMap { $0 }
    // mypoint에 저장
    let myFigure = CoordGenerator.classifyFigure(coordinates: inputedCoordinates)
    // 화면 초기화
    PrintView.eraseDisplay()
    // 좌표계 위에 포인트 출력
    PrintView.printOnCoordSystem(myFigure)
}



main()

