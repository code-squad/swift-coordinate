//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main(){
    let inputView = InputView()
    let outputView = OutputView()
    var inputUser : String
    var checkUserInput = CheckUserInput(input: "")
//    var xyPosition : (positionX: String, positionY: String) = ("", "")
    var stateError : ErrorState = .nilNumber
    
    repeat{
        inputUser = inputView.readInput(message: "좌표를 입력해주세요.")
        stateError = checkUserInput.checkErrorState(input: inputUser)
        outputView.ErrorStatePrint(stateError)
    }while stateError == .outOfRangeCharacter || stateError == .overFlowNumber || stateError == .wrongOrder
    guard let point = ShapeCreator.createPoint(xyPosition: inputUser) else { return }

    outputView.clearBackground()
    outputView.drawAxis()
    outputView.drawPoint(point: point)
}

main()


