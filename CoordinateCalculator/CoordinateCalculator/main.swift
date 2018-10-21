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
    let checkUserInput = CheckUserInput()
    var inputFromUser : (positionX: Int?, positionY: Int?)
    var point : MyPoint
    
    repeat{
        inputFromUser = inputView.splitXandYlocation()
    }while checkUserInput.IsRightUserInput(input: inputFromUser.positionX) || checkUserInput.IsRightUserInput(input: inputFromUser.positionY)
    point = MyPoint(xPosition: inputFromUser.positionX!, yPosition: inputFromUser.positionY!)
    
    outputView.clearBackground()
    outputView.drawAxis()
    outputView.drawPoint(point: point)
}

main()

