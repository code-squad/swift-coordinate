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
    var stateError : ErrorState
    
    repeat{
        inputUser = inputView.readInput(message: "좌표를 입력해주세요.")
        checkUserInput.setinput(inputUser)
        stateError = checkUserInput.checkErrorState()
        outputView.ErrorStatePrint(stateError)
    }while stateError != .rightInput
    
    let shapeCreator = ShapeCreator()
    let shape : Shape? = shapeCreator.CreateShape(input: inputUser)
//    guard let point = ShapeCreator.createPoint(point: inputUser) else { return }
//
//    outputView.clearBackground()
//    outputView.drawAxis()
//    outputView.drawPoint(point: point)
}

main()


