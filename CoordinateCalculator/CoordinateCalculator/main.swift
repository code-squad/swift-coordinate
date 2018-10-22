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
    var inputFromUser : (positionX: String, positionY: String) = ("", "")
    var stateCurrent : ErrorState = .nilNumber
    
    while stateCurrent == .nilNumber || stateCurrent == .overFlowNumber {
        inputFromUser = inputView.splitXandYlocation(input: inputView.readInput(message: "좌표를 입력해주세요."))
        stateCurrent = CheckUserInput.checkErrorState(positionX: inputFromUser.positionX, positionY: inputFromUser.positionY)
        if stateCurrent == .nilNumber{ print("올바른 숫자를 입력하시오.") }
        else if stateCurrent == .overFlowNumber { print("입력범위를 초과하였습니다.") }
    }
    guard let positionX = Int(inputFromUser.positionX) else { return }
    guard let positionY = Int(inputFromUser.positionY) else { return }
    let point : MyPoint = MyPoint(xPosition: positionX, yPosition: positionY)
    
    outputView.clearBackground()
    outputView.drawAxis()
    outputView.drawPoint(point: point)
}

main()

