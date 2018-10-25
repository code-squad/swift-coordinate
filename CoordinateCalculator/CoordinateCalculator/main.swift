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
    let checkUserInput = CheckUserInput()
    var inputState : InputState
    
    repeat{
        inputUser = inputView.readInput(message: "좌표를 입력해주세요.")
        inputState = checkUserInput.checkErrorState(needToCheck: inputUser)
        outputView.ErrorStatePrint(inputState)
    }while inputState != .rightInput
    
    let shapeCreator = ShapeCreator()
    guard let shape = shapeCreator.CreateShape(input: inputUser) else { return }
    
    outputView.clearBackground()
    outputView.drawAxis()
    outputView.drawShape(shape: shape)
}

main()


