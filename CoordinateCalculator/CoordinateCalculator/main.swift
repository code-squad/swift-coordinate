//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//



import Foundation

enum ErrorState {
    case nilNumber
    case overFlowNumber
    case rightInput
}

func main(){
    let inputView = InputView()
    let outputView = OutputView()
    var inputUser : String
    var xyPosition : (positionX: String, positionY: String) = ("", "")
    var stateError : ErrorState = .nilNumber
    
    while stateError == .nilNumber || stateError == .overFlowNumber {
        inputUser = inputView.readInput(message: "좌표를 입력해주세요.")
        xyPosition = inputView.splitXandYlocation(input: inputUser)
        stateError = CheckUserInput.checkErrorState(positionX: xyPosition.positionX, positionY: xyPosition.positionY)
        if stateError == .nilNumber{ print("올바른 숫자를 입력하시오.") }
        else if stateError == .overFlowNumber { print("입력범위를 초과하였습니다.") }
    }
    guard let point = ShapeCreator.createPoint(xPosition: xyPosition.positionX, yPosition: xyPosition.positionY) else { return }

    outputView.clearBackground()
    outputView.drawAxis()
    outputView.drawPoint(point: point)
}

main()

