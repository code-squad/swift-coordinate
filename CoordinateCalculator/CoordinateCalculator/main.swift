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
    
    //좌표그리기
    OutputView.drawAxis()
    OutputView.drawDot()
    
    //값가공하기
    let str = Process.trimAndSplit(inputValue: input)
    let coordinate = Process.makeCoordinateValueFrom(inputs: str)
    let pointValue = Process.point(from: coordinate)
    
    dump(pointValue)
}

try main()

