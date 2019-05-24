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
        var processingValue = [String]()
        
        do {
            let question = "좌표를 입력해주세요(예:(10,10))"
            let input = try InputView.ask(about: question)
            processingValue = try Process.checkFormat(inputValue: input)
        
        } catch let error as UserInputError {
            print(error.description)
            continue
        } catch {
            print(UserInputError.unknown)
            continue
        }
        
        do {
            coordinateValue = try Process.convertForm(values: processingValue)
            break
            
        } catch let error as UserInputError {
            print(error.description)
        } catch {
            print(UserInputError.unknown)
        }
   }

    let dot = InputView.makePoint(x: coordinateValue.x, y: coordinateValue.y)

    OutputView.drawAxis()
    OutputView.drawDot(at: dot)
}

main()

