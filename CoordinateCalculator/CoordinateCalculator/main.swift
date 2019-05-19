//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main()  {
    
    var coordinateValue = (x: 0, y: 0)

    while true {
        do {
            let question = "좌표를 입력해주세요(예:(10,10))"
            let input = try InputView.ask(about: question)
            
            let processingValue = try Process.checkFormat(inputValue: input)
            coordinateValue = try Process.convertForm(values: processingValue)
            break
            
        } catch let error as ErrorMessage {
            print(error.description)
        } catch {
            print("알수없는오류발생")
        }
   }
    //좌표값 저장
    let dot = MyPoint(x: coordinateValue.x, y: coordinateValue.y)
    //좌표출력
    OutputView.drawAxis()
    OutputView.drawDot(at: dot)
}

main()

