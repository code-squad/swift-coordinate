//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main()  {
    
   // var coordinateValue = (x: 0, y: 0)

    while true {
        
        do {
            let question = "좌표를 입력해주세요(예:(10,10))"
            let input = InputView.ask(about: question)
            var coordinateValue = try Validify.separate(element: input)

            let dot = ShapeMaker.makeShape(points: coordinateValue)
            
            guard let dotdot = dot else {
                print("지원되지 않는 도형입니다.")
                continue
            }
        
            OutputView.drawAxis()
            OutputView.draw(shape: dotdot)
            
            break
        } catch let error as UserInputError {
            print(error.description)
        } catch {
            print(UserInputError.unknown)
        }
    }
}

main()

