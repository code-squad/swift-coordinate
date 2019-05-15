//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() throws {
    
    //입력
    let question = "좌표를 입력해주세요(예:(10,10))"
    let input = try InputView.ask(about: question)
    
    //입력값 가공
    let processingValue = try Process.checkFormat(inputValue: input)
    let coordinateValue = try Process.convertForm(checkValue: processingValue)
    
    //좌표값 저장
    let dot = MyPoint(x: coordinateValue.x, y: coordinateValue.y)
    
    //좌표출력
    OutputView.drawAxis()
    OutputView.drawDot(at: dot)

    
}

try main()

