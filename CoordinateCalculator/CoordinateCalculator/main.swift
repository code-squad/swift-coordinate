//
//  main.swift
//  CoordinateCalculator
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {

    while true {
        
        let input = InputView.ask(about: "좌표를 입력해주세요(예:(10,10))")
        
        do {
            
            let shape = try CoordinateCalculator.makeShape(from: input)
            
            OutputView.drawAxis()
            OutputView.draw(shape: shape)
            if let line = shape as? MyLine {
                OutputView.printDistance(line: line)
            }
            
            
            break
        } catch let error as UserInputError {
            print(error.description)
        } catch CoordinateCalculatorError.unsupportedShape {
            print(CoordinateCalculatorError.unsupportedShape.rawValue)
        } catch {
            print(UserInputError.unknown)
        }
    }
}

main()



