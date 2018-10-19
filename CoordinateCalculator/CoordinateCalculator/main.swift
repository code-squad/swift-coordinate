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
    var point : MyPoint
     
    repeat{
        point = inputView.splitXandYlocation(location: inputView.readInput(message: "좌표를 입력해주세요."))
    }while CheckUserInput.IsOverFlowNumber(position: point.xPosition) || CheckUserInput.IsOverFlowNumber(position: point.yPosition)
    
    outputView.clearBackground()
    outputView.drawAxis()
    outputView.drawPoint(point: point)
}

main()

