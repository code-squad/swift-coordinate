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
    var inputFromUser : (positionX: String, positionY: String)
    var positionX : Int = 0
    var positionY : Int = 0
    
    
    
    while true{
        inputFromUser = inputView.splitXandYlocation()
        if let tempPositionX = Int(inputFromUser.positionX){ positionX = tempPositionX } else { return }
        if let tempPositionY = Int(inputFromUser.positionY){ positionY = tempPositionY } else { return }
        if !checkUserInput.IsOverFlowNumber(notNilNumber: positionX) && !checkUserInput.IsOverFlowNumber(notNilNumber: positionY) { break }
        print("입력범위를 초과하였습니다.")
    }
    let point : MyPoint = MyPoint(xPosition: positionX, yPosition: positionY)
    
    outputView.clearBackground()
    outputView.drawAxis()
    outputView.drawPoint(point: point)
}

main()

